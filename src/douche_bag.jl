"""
    DoucheBag{T} <: AbstractPlayer

A DoucheBag type for the iterated public goods game. The douche bag contributes no money to the public good 
and punishes other players indiscriminantly. 

# Fields

- `id::Symbol`: a unique name for the player 
- `ids::T`: a list of all player ids excluding player id
- `trial_start_money`: the money provided at the begining of each trial 
- `total_money`: the cumulative money earned across completed trials 
"""
mutable struct DoucheBag{T} <: AbstractPlayer
    id::Symbol
    ids::T
    trial_start_money::Float64
    total_money::Float64    
end

"""
    DoucheBag(; id, ids, game_config)

A constructor for the DoucheBag player type. Additional keyword arguments can be added and passed via 
`args` in the function `battle!`.

# Keywords 

- `id`: the DoucheBag player id 
- `ids`: a list of all player ids excluding player id
- `game_config`: a set of keywords corresponding to parameters of the iterated public goods game
"""
function DoucheBag(; id, ids, game_config)
    ids = setdiff(ids, [id])
    return DoucheBag(id, ids, 0.0, 0.0)
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
        contributions::Dict
    ) 

Optionally observe each players contribution.

# Arguments

- `game_type::Type{<:AbstractPublicGoodsGame}`: public goods game type 
- `player::DoucheBag`: an abstract player type 
- `contributions::Dict`: each player's contribution: id => contribution

# Returns

- nothing
"""
function observe_contributions!(
    game_type::Type{<:AbstractPublicGoodsGame},
    player::DoucheBag,
    contributions::Dict
)
end

"""
    observe_punishments!(
        game_type::Type{<:AbstractPublicGoodsGame},
        player::DoucheBag,
        punisher_id::T,
        punishment::Dict{T, N}
    ) 

Optionally observe the punishments from the punisher.

# Arguments

- `game_type::Type{<:AbstractPublicGoodsGame}`: public goods game type 
- `player::DoucheBag`: an abstract player type 
- `contributions::Dict{T,N}`: each player's contribution: id => contribution

# Returns

- nothing
"""
function observe_punishments!(
    game_type::Type{<:AbstractPublicGoodsGame},
    player::DoucheBag,
    punisher_id::T,
    punishment::Dict{T, N}
) where {T, N}
end

"""
    punish(game_type::Type{<:AbstractPublicGoodsGame}, player::DoucheBag, ids)

Optionally setup player before playing iterated public goods game.

# Arguments

- `game_type::Type{<:AbstractPublicGoodsGame}`: public goods game type 
- `player::DoucheBag`: an abstract player type 

# Returns

- `punishments::Dict{T, Float64}`: punishment amount associated with each player: id => punishment
"""
function punish(game_type::Type{<:AbstractPublicGoodsGame}, player::DoucheBag)
    n_players = length(player.ids)
    punishment_amount = player.total_money / (n_players * 3)
    return Dict(id => punishment_amount for id ∈ player.ids)
end
