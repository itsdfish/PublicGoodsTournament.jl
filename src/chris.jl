mutable struct Chris <: AbstractPlayer
    id::Symbol
    trial_start_money::Float64
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

"""
    setup!(
        game_type::Type{<:AbstractPublicGoodsGame},
        player::Chris,
        ids,
        game_config
    )

Optionally setup player before playing iterated public goods game.

# Arguments

- `game_type::Type{<:AbstractPublicGoodsGame}`: public goods game type 
- `player::Chris`: an abstract player type 
- `ids`: a collection of player ids 
- `game_config`: keyword arguments of game options
"""
function setup!(
    game_type::Type{<:AbstractPublicGoodsGame},
    player::Chris,
    ids,
    game_config
)
end
