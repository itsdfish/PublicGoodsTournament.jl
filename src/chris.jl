"""
    Chris <: AbstractPlayer

A player type for the iterated public goods game. The API requireds the following 
fields, but more can be added to support your player's strategy.

# Fields

- `id::Symbol`: a unique name for the player 
- `trial_start_money`: the money provided at the begining of each trial 
- `total_money`: the cumulative money earned across completed trials 
"""
mutable struct Chris <: AbstractPlayer
    id::Symbol
    trial_start_money::Float64
    total_money::Float64
end

function Chris(; id, ids, game_config)
    return Chris(id, 0.0, 0.0)
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
end

"""
    observe_contributions!(
        game_type::Type{<:AbstractPublicGoodsGame},
        player::Chris,
        contributions::Dict{T, Float64}
    ) 

Optionally observe each players contribution.

# Arguments

- `game_type::Type{<:AbstractPublicGoodsGame}`: public goods game type 
- `player::Chris`: an abstract player type 
- `contributions::Dict{T,Float64}`: each player's contribution: id => contribution

# Returns

- nothing
"""
function observe_contributions!(
    game_type::Type{<:AbstractPublicGoodsGame},
    player::Chris,
    contributions::Dict{T, Float64}
) where {T}
end

"""
    observe_punishments!(
        game_type::Type{<:AbstractPublicGoodsGame},
        player::Chris,
        punisher_id::T,
        punishment::Dict{T, Float64}
    ) 

Optionally observe the punishments from the punisher.

# Arguments

- `game_type::Type{<:AbstractPublicGoodsGame}`: public goods game type 
- `player::Chris`: an abstract player type 
- `contributions::Dict{T,Float64}`: each player's contribution: id => contribution

# Returns

- nothing
"""
function observe_punishments!(
    game_type::Type{<:AbstractPublicGoodsGame},
    player::Chris,
    punisher_id::T,
    punishment::Dict{T, Float64}
) where {T}
end

"""
    punish(game_type::Type{<:AbstractPublicGoodsGame}, player::Chris, ids)

Optionally setup player before playing iterated public goods game.

# Arguments

- `game_type::Type{<:AbstractPublicGoodsGame}`: public goods game type 
- `player::Chris`: an abstract player type 
- `ids`: a collection of player ids 

# Returns

- `punishments::Dict{T, Float64}`: punishment amount associated with each player: id => punishment
"""
function punish(game_type::Type{<:AbstractPublicGoodsGame}, player::Chris, ids)
end
