"""
    Chris <: AbstractPlayer

A player type for the iterated public goods game. The API requireds the following 
fields, but more can be added to support your player's strategy.

# Fields

- `id::Symbol`: a unique name for the player 
- `ids::T`: a list of all player ids excluding player
- `trial_start_money`: the money provided at the begining of each trial 
- `total_money`: the cumulative money earned across completed trials 
"""
mutable struct Chris{T} <: AbstractPlayer
    id::Symbol
    ids::T
    trial_start_money::Float64
    total_money::Float64
    players_money::Dict{Symbol, Float64}
    contributions::Dict{Symbol, Float64}
end

"""
    Chris(; id, ids, game_config)

A constructor for the Chris player type. Additional keyword arguments can be added and passed via 
`args` in the function `battle!`.

# Keywords 

- `id`: the Chris player id 
- `ids`: a list of all player ids excluding player
- `game_config`: a set of keywords corresponding to parameters of the iterated public goods game
"""
function Chris(; id, ids, game_config)
    _ids = setdiff(ids, [id])
    players_money = Dict(id => 0.0 for id ∈ ids)
    contributions = Dict(id => 0.0 for id ∈ ids)
    return Chris(id, _ids, 0.0, 0.0, players_money, contributions)
end

"""
    contribute(game_type::Type{<:AbstractPublicGoodsGame}, player::Chris)

Contribute to the public good.

# Arguments

- `game_type::Type{<:AbstractPublicGoodsGame}`: public goods game type 
- `player::Chris`: an abstract player type 

# Returns

- `contribution::Float64`: the amount contributed to the public good
"""
function contribute(game_type::Type{<:AbstractPublicGoodsGame}, player::Chris)
    _, best_id = findmax(player.players_money)
    if best_id == player.id
        return player.trial_start_money
    else
        return player.contributions[best_id]
    end
end

"""
    observe_contributions!(
        game_type::Type{<:AbstractPublicGoodsGame},
        player::Chris,
        contributions::Dict
    ) 

Optionally observe each players contribution.

# Arguments

- `game_type::Type{<:AbstractPublicGoodsGame}`: public goods game type 
- `player::Chris`: an abstract player type 
- `contributions::Dict`: each player's contribution: id => contribution

# Returns

- nothing
"""
function observe_contributions!(
    game_type::Type{<:AbstractPublicGoodsGame},
    player::Chris,
    contributions::Dict
)
    player.contributions = contributions
    return nothing
end

"""
    observe_punishments!(
        game_type::Type{<:AbstractPublicGoodsGame},
        player::Chris,
        punisher_id::T,
        punishment::Dict{T, N}
    ) 

Optionally observe the punishments from the punisher.

# Arguments

- `game_type::Type{<:AbstractPublicGoodsGame}`: public goods game type 
- `player::Chris`: an abstract player type 
- `contributions::Dict{T,N}`: each player's contribution: id => contribution

# Returns

- nothing
"""
function observe_punishments!(
    game_type::Type{<:AbstractPublicGoodsGame},
    player::Chris,
    punisher_id::T,
    punishment::Dict{T, N}
) where {T, N}
    return nothing
end

"""
    punish(game_type::Type{<:AbstractPublicGoodsGame}, player::Chris, ids)

Optionally setup player before playing iterated public goods game.

# Arguments

- `game_type::Type{<:AbstractPublicGoodsGame}`: public goods game type 
- `player::Chris`: an abstract player type 

# Returns

- `punishments::Dict{T, Float64}`: punishment amount associated with each player: id => punishment
"""
function punish(game_type::Type{<:AbstractPublicGoodsGame}, player::Chris)
    return Dict(id => 0.0 for id ∈ player.ids)
end

"""
    observe_total_money!(
        game_type::Type{<:AbstractPublicGoodsGame},
        player::Chris,
        total_money::Dict
    )

Optionally observe the total money of all players.

# Arguments

- `game_type::Type{<:AbstractPublicGoodsGame}`: public goods game type 
- `player::Chris`: an abstract player type 
- `contributions::Dict`: each player's contribution: id => contribution

# Returns

- nothing
"""
function observe_total_money!(
    game_type::Type{<:AbstractPublicGoodsGame},
    player::Chris,
    total_money::Dict
)
    player.players_money = total_money
    return nothing
end
