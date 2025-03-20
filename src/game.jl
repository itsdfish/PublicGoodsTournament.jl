
"""
    battle!(; n_trials, game_type, ids, types, args, game_config)

Performs a battle of `n_trials` of the iterated the public goods game between players specified in `ids`. On each trial, the following actions are performed:

1. Each player is endowed with money 
2. Each contributes to the public good without knowing the contributions of the other players
3. The public good is updated based on contributions and divided among players 
4. The players observe the contributions of others. 
5. The players can punish the others and view the punishments of other players

# Keywords 

- `n_trials`: the number of trials performed 
- `game_type`: the game type, which is used for the game constructor
- `types`: a tuple of player types
- `args`: a tuple of NamedTuples consisting keyword arguments passed to the player constructors
- `ids`: a list of all player ids 
- `game_config`: a set of keywords corresponding to parameters of the iterated public goods game

# Returns 

- `game::game_type`: a game constraining game configuration parameters and total money for each player
"""
function battle!(; n_trials, game_type, ids, types, args, game_config)
    players = Dict(id => t(; id, game_config, a...) for (t, id, a) in zip(types, ids, args))
    game = game_type(; ids, game_config...)
    battle!(game, players, n_trials)
    return game
end

function battle!(game::G, players, n_trials) where {G <: AbstractPublicGoodsGame}
    for _ ∈ 1:n_trials
        add_money!(game, players)
        contributions = contribute!(game, players)
        update_money!(game, players, contributions)
        observe_contributions!(game, players, contributions)
        punish(game, players)
    end
    return nothing
end

function contribute!(
    game::G,
    players::Dict{T, A}
) where {T, A, G <: AbstractPublicGoodsGame}
    contributions = Dict{T, Float64}()
    for (id, player) ∈ players
        contribution = contribute(G, player)
        validate_contribution(game, player, contribution)
        contributions[id] = contribution
    end
    return contributions
end

function observe_contributions!(
    game::G,
    players::Dict,
    contributions::Dict
) where {G <: AbstractPublicGoodsGame}
    for (_, player) ∈ players
        observe_contributions!(G, player, contributions)
    end
end

function punish(game::G, players::Dict) where {G <: AbstractPublicGoodsGame}
    for (_, player) ∈ players
        punishments = punish(G, player)
        validate_punishments(game, player, punishments)
        apply_punishments!(game, player, punishments)
        map(p -> observe_punishments!(G, p, player.id, punishments), values(players))
    end
    return nothing
end

function apply_punishments!(
    game::AbstractPublicGoodsGame,
    player::AbstractPlayer,
    punishments::Dict
)
    (; total_money) = game
    for (id, punishment) ∈ punishments
        total_money[id] -= punishment
        total_money[player.id] -= punishment
    end
    return nothing
end

function validate_contribution(
    game::AbstractPublicGoodsGame,
    player::AbstractPlayer,
    contribution
)
    if contribution < 0
        error("$(player.id)'s contribution is too small. Minimum contribution is 0.")
    elseif contribution > game.trial_start_money
        error("$(player.id)'s contribution is too large. Maximum contribution is $(game.trial_start_money).")
    end
    return nothing
end

function validate_punishments(
    game::AbstractPublicGoodsGame,
    player::AbstractPlayer,
    punishments
)
    total_money = game.total_money[player.id]
    vals = values(punishments)
    total_punishment = sum(vals)
    max_punishment = min(total_money, game.max_punishment_amount)
    if total_punishment == 0
        return nothing
    end
    if total_punishment > max_punishment
        reason =
            max_punishment == total_money ? "its total money" :
            "the maximum punishment amount"
        error("$(player.id)'s total punishment amount of $total_punishment exceeds $reason of $max_punishment")
    elseif any(x -> x < 0, vals)
        error("$(player.id)'s punishments contain a negative value.")
    end
    return nothing
end

function add_money!(game::AbstractPublicGoodsGame, player::AbstractPlayer)
    player.trial_start_money = game.trial_start_money
    return nothing
end

function add_money!(game::AbstractPublicGoodsGame, players::Dict)
    for (_, player) ∈ players
        add_money!(game, player)
    end
    return nothing
end

"""
    update_money!(game::AbstractPublicGoodsGame, players::Dict, contributions::Dict)

Update total money for game and each agent.

# Arguments

- `Game:::AbstractPublicGoodsGame`: public goods game type 
- `players::Dict`: mapping of id to player objects: id => player
- `contributions::Dict`: mapping of id to contributions: id => contribution

# Returns

- nothing
"""
function update_money!(game::AbstractPublicGoodsGame, players::Dict, contributions::Dict)
    (; total_money, trial_start_money, public_goods_multiplier) = game
    public_good = sum(values(contributions)) * public_goods_multiplier / length(total_money)
    for (id, contribution) ∈ contributions
        game.total_money[id] += (trial_start_money - contribution + public_good)
        players[id].total_money = game.total_money[id]
    end
    return nothing
end
