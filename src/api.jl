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
        contributions::Dict{T, N}
    ) 

Optionally observe each players contribution.

# Arguments

- `game_type::Type{<:AbstractPublicGoodsGame}`: public goods game type 
- `player::AbstractPlayer`: an abstract player type 
- `contributions::Dict`: each player's contribution: id => contribution

# Returns

- nothing
"""
function observe_contributions!(
    game_type::Type{<:AbstractPublicGoodsGame},
    player::AbstractPlayer,
    contributions::Dict
)
    return nothing
end

"""
    punish(game_type::Type{<:AbstractPublicGoodsGame}, player::AbstractPlayer)

Optionally setup player before playing iterated public goods game.

# Arguments

- `game_type::Type{<:AbstractPublicGoodsGame}`: public goods game type 
- `player::AbstractPlayer`: an abstract player type 

# Returns

- `punishments::Dict{T, Float64}`: punishment amount associated with each player: id => punishment
"""
function punish(game_type::Type{<:AbstractPublicGoodsGame}, player::AbstractPlayer)
end

"""
    observe_punishments!(
        game_type::Type{<:AbstractPublicGoodsGame},
        player::AbstractPlayer,
        punisher_id::T,
        punishment::Dict{T, N}
    ) 

Optionally observe the punishments from the punisher.

# Arguments

- `game_type::Type{<:AbstractPublicGoodsGame}`: public goods game type 
- `player::AbstractPlayer`: an abstract player type 
- `contributions::Dict{T,N}`: each player's contribution: id => contribution

# Returns

- nothing
"""
function observe_punishments!(
    game_type::Type{<:AbstractPublicGoodsGame},
    player::AbstractPlayer,
    punisher_id::T,
    punishment::Dict{T, N}
) where {T, N}
    return nothing
end

"""
    observe_total_money!(
        game_type::Type{<:AbstractPublicGoodsGame},
        player::AbstractPlayer,
        total_money::Dict
    )

Optionally observe the total money of all players.

# Arguments

- `game_type::Type{<:AbstractPublicGoodsGame}`: public goods game type 
- `player::AbstractPlayer`: an abstract player type 
- `contributions::Dict`: each player's contribution: id => contribution

# Returns

- nothing
"""
function observe_total_money!(
    game_type::Type{<:AbstractPublicGoodsGame},
    player::AbstractPlayer,
    total_money::Dict
)
    return nothing
end