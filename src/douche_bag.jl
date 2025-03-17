"""
    DoucheBag <: AbstractPlayer

A DoucheBag type for the iterated public goods game. The douche bag contributes no money to the public good 
and punishes other players indiscriminantly. 

# Fields

- `id::Symbol`: a unique name for the player 
- `trial_start_money`: the money provided at the begining of each trial 
- `total_money`: the cumulative money earned across completed trials 
"""
mutable struct DoucheBag <: AbstractPlayer
    id::Symbol
    trial_start_money::Float64
    total_money::Float64
end

function DoucheBag(; id, ids, game_config)
    return DoucheBag(id, 0.0, 0.0)
end

"""
    contribute(game_type::Type{<:AbstractPublicGoodsGame}, player::DoucheBag)

Contribute to the public good.

# Arguments

- `game_type::Type{<:AbstractPublicGoodsGame}`: public goods game type 
- `player::DoucheBag`: an abstract player type 

# Returns

- `contribution::Float64`: the amount contributed to the public good
"""
function contribute(game_type::Type{<:AbstractPublicGoodsGame}, player::DoucheBag)
    return 0.0
end

"""
    observe_contributions!(
        game_type::Type{<:AbstractPublicGoodsGame},
        player::DoucheBag,
        contributions::Dict{T, Float64}
    ) 

Optionally observe each players contribution.

# Arguments

- `game_type::Type{<:AbstractPublicGoodsGame}`: public goods game type 
- `player::DoucheBag`: an abstract player type 
- `contributions::Dict{T,Float64}`: each player's contribution: id => contribution

# Returns

- nothing
"""
function observe_contributions!(
    game_type::Type{<:AbstractPublicGoodsGame},
    player::DoucheBag,
    contributions::Dict{T, Float64}
) where {T}
end

"""
    observe_punishments!(
        game_type::Type{<:AbstractPublicGoodsGame},
        player::DoucheBag,
        punisher_id::T,
        punishment::Dict{T, Float64}
    ) 

Optionally observe the punishments from the punisher.

# Arguments

- `game_type::Type{<:AbstractPublicGoodsGame}`: public goods game type 
- `player::DoucheBag`: an abstract player type 
- `contributions::Dict{T,Float64}`: each player's contribution: id => contribution

# Returns

- nothing
"""
function observe_punishments!(
    game_type::Type{<:AbstractPublicGoodsGame},
    player::DoucheBag,
    punisher_id::T,
    punishment::Dict{T, Float64}
) where {T}
end

"""
    punish(game_type::Type{<:AbstractPublicGoodsGame}, player::DoucheBag, ids)

Optionally setup player before playing iterated public goods game.

# Arguments

- `game_type::Type{<:AbstractPublicGoodsGame}`: public goods game type 
- `player::DoucheBag`: an abstract player type 
- `ids`: a collection of player ids 

# Returns

- `punishments::Dict{T, Float64}`: punishment amount associated with each player: id => punishment
"""
function punish(game_type::Type{<:AbstractPublicGoodsGame}, player::DoucheBag, ids)
    other_ids = setdiff(ids, [player.id])
    n_players = length(other_ids)
    punishment_amount = player.total_money / (n_players * 3)
    return Dict(id => punishment_amount for id ∈ other_ids)
end
