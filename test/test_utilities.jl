import PublicGoodsTournement: contribute
import PublicGoodsTournement: observe_contributions!
import PublicGoodsTournement: observe_punishments!
import PublicGoodsTournement: punish

mutable struct Player <: AbstractPlayer
    id::Symbol
    trial_start_money::Float64
    total_money::Float64
end

function Player(; id, ids, game_config)
    return Player(id, 0.0, 0.0)
end

"""
    contribute(game_type::Type{<:AbstractPublicGoodsGame}, player::Player)

Contribute to the public good.

# Arguments

- `game_type::Type{<:AbstractPublicGoodsGame}`: public goods game type 
- `player::Player`: an abstract player type 

# Returns

- `contribution::Float64`: the amount contributed to the public good
"""
function contribute(game_type::Type{<:AbstractPublicGoodsGame}, player::Player)
    return 1.0
end

"""
    observe_contributions!(
        game_type::Type{<:AbstractPublicGoodsGame},
        player::Player,
        contributions::Dict{T, Float64}
    ) 

Optionally observe each players contribution.

# Arguments

- `game_type::Type{<:AbstractPublicGoodsGame}`: public goods game type 
- `player::Player`: an abstract player type 
- `contributions::Dict{T,Float64}`: each player's contribution: id => contribution

# Returns

- nothing
"""
function observe_contributions!(
    game_type::Type{<:AbstractPublicGoodsGame},
    player::Player,
    contributions::Dict{T, Float64}
) where {T}
end

"""
    observe_punishments!(
        game_type::Type{<:AbstractPublicGoodsGame},
        player::Player,
        punisher_id::T,
        punishment::Dict{T, Float64}
    ) 

Optionally observe the punishments from the punisher.

# Arguments

- `game_type::Type{<:AbstractPublicGoodsGame}`: public goods game type 
- `player::Player`: an abstract player type 
- `contributions::Dict{T,Float64}`: each player's contribution: id => contribution

# Returns

- nothing
"""
function observe_punishments!(
    game_type::Type{<:AbstractPublicGoodsGame},
    player::Player,
    punisher_id::T,
    punishment::Dict{T, Float64}
) where {T}
end

"""
    punish(game_type::Type{<:AbstractPublicGoodsGame}, player::Player, ids)

Optionally setup player before playing iterated public goods game.

# Arguments

- `game_type::Type{<:AbstractPublicGoodsGame}`: public goods game type 
- `player::Player`: an abstract player type 
- `ids`: a collection of player ids 

# Returns

- `punishments::Dict{T, Float64}`: punishment amount associated with each player: id => punishment
"""
function punish(game_type::Type{<:AbstractPublicGoodsGame}, player::Player, ids)
    return Dict(id => 0.0 for id ∈ ids)
end

