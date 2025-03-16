"""
    AbstractPlayer

An abstract player type for the public goods game. Subtypes of this abstract type must have the following fields

# Fields 

- `id`: unique player id 
- `trial_start_money::Float64`: the amount of money at the beginning of a trial
"""
abstract type AbstractPlayer end

"""
    AbstractPublicGoodsGame

An abstract public goods game object which expects the following fields.

# Fields

- `total_money::Dict{T, Float64}`: the total amount of money for each player
- `public_goods_multiplier::Float64`: the amount by which pooled contributions are multipled
- `trial_start_money`: the amount of money given to an player at the begining of each trial
- `max_punishment_amount::Float64`: the maximum amount that an player can punish on any given trial
"""
abstract type AbstractPublicGoodsGame end

function battle!(; n_trials, game_type, ids, types, args, game_config)
    players = Dict(id => t(; id, a...) for (t, id, a) in zip(types, ids, args))
    game = game_type(; ids, game_config...)
    map(p -> setup!(game_type, p, ids, game_config), values(players))
    battle!(game, players, n_trials)
    return game
end

function battle!(game::G, players, n_trials) where {G <: AbstractPublicGoodsGame}
    for _ ∈ 1:n_trials
        add_money!(game, players)
        contributions = contribute!(game, players)
        update_money!(game, contributions)
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
    ids = keys(players)
    for (_, player) ∈ players
        punishments = punish(G, player, ids)
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
    if total_punishment > total_money
        error("$(player.id)'s total punishment amount of $total_punishment exceeds its total money of $total_money")
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
    update_money!(game::AbstractPublicGoodsGame, contributions)

Update each agents money based on contribution and total public good.

# Arguments

- `player::AbstractPlayer`: an abstract player type 

# Returns

- `contribution::Float64`: the amount contributed to the public good
"""
function update_money!(game::AbstractPublicGoodsGame, contributions)
    (; total_money, trial_start_money, public_goods_multiplier) = game
    public_good = sum(values(contributions)) * public_goods_multiplier / length(total_money)
    for (id, contribution) ∈ contributions
        game.total_money[id] += (trial_start_money - contribution + public_good)
    end
    return nothing
end

"""
    contribute(game_type::Type{<:AbstractPublicGoodsGame}, player::AbstractPlayer)

Contribute to the public good.

# Arguments

- `game_type::Type{<:AbstractPublicGoodsGame}`: public goods game type 
- `player::AbstractPlayer`: an abstract player type 

# Returns

- `contribution::Float64`: the amount contributed to the public good
"""
function contribute(game_type::Type{<:AbstractPublicGoodsGame}, player::AbstractPlayer)
end

"""
    observe_contributions!(
        game_type::Type{<:AbstractPublicGoodsGame},
        player::AbstractPlayer,
        contributions::Dict{T, Float64}
    ) 

Optionally observe each players contribution.

# Arguments

- `game_type::Type{<:AbstractPublicGoodsGame}`: public goods game type 
- `player::AbstractPlayer`: an abstract player type 
- `contributions::Dict{T,Float64}`: each player's contribution: id => contribution

# Returns

- nothing
"""
function observe_contributions!(
    game_type::Type{<:AbstractPublicGoodsGame},
    player::AbstractPlayer,
    contributions::Dict{T, Float64}
) where {T}
end

"""
    observe_punishments!(
        game_type::Type{<:AbstractPublicGoodsGame},
        player::AbstractPlayer,
        punisher_id::T,
        punishment::Dict{T, Float64}
    ) 

Optionally observe the punishments from the punisher.

# Arguments

- `game_type::Type{<:AbstractPublicGoodsGame}`: public goods game type 
- `player::AbstractPlayer`: an abstract player type 
- `contributions::Dict{T,Float64}`: each player's contribution: id => contribution

# Returns

- nothing
"""
function observe_punishments!(
    game_type::Type{<:AbstractPublicGoodsGame},
    player::AbstractPlayer,
    punisher_id::T,
    punishment::Dict{T, Float64}
) where {T}
end

"""
    punish(game_type::Type{<:AbstractPublicGoodsGame}, player::AbstractPlayer, ids)

Optionally setup player before playing iterated public goods game.

# Arguments

- `game_type::Type{<:AbstractPublicGoodsGame}`: public goods game type 
- `player::AbstractPlayer`: an abstract player type 
- `ids`: a collection of player ids 

# Returns

- `punishments::Dict{T, Float64}`: punishment amount associated with each player: id => punishment
"""
function punish(game_type::Type{<:AbstractPublicGoodsGame}, player::AbstractPlayer, ids)
end

"""
    setup!(
        game_type::Type{<:AbstractPublicGoodsGame},
        player::AbstractPlayer,
        ids,
        game_config
    )

Optionally setup player before playing iterated public goods game.

# Arguments

- `game_type::Type{<:AbstractPublicGoodsGame}`: public goods game type 
- `player::AbstractPlayer`: an abstract player type 
- `ids`: a collection of player ids 
- `game_config`: keyword arguments of game options
"""
function setup!(
    game_type::Type{<:AbstractPublicGoodsGame},
    player::AbstractPlayer,
    ids,
    game_config
)
end
