"""
    Greedy <: AbstractPlayer

A Greedy type for the iterated public goods game. The chuck contributes its entire trial endowment to the public good 
and does not punish. 

# Fields

- `id::Symbol`: a unique name for the player 
- `ids::T`: a list of all player ids excluding player id
- `trial_start_money`: the money provided at the begining of each trial 
- `total_money`: the cumulative money earned across completed trials 
"""
mutable struct Greedy{T} <: AbstractPlayer
    id::Symbol
    ids::T
    trial_start_money::Float64
    total_money::Float64
end

"""
    Greedy(; id, ids, game_config)

A constructor for the Greedy player type. Additional keyword arguments can be added and passed via 
`args` in the function `battle!`.

# Keywords 

- `id`: the Greedy player id 
- `ids`: a list of all player ids excluding player id
- `game_config`: a set of keywords corresponding to parameters of the iterated public goods game
"""
function Greedy(; id, ids, game_config)
    ids = setdiff(ids, [id])
    return Greedy(id, ids, 0.0, 0.0)
end

"""
    contribute(game_type::Type{<:AbstractPublicGoodsGame}, player::Greedy)

Contribute to the public good.

# Arguments

- `game_type::Type{<:AbstractPublicGoodsGame}`: public goods game type 
- `player::Greedy`: an abstract player type 

# Returns

- `contribution::Float64`: the amount contributed to the public good
"""
function contribute(game_type::Type{<:AbstractPublicGoodsGame}, player::Greedy)
    return 0.0
end

"""
    observe_contributions!(
        game_type::Type{<:AbstractPublicGoodsGame},
        player::Greedy,
        contributions::Dict
    ) 

Optionally observe each players contribution.

# Arguments

- `game_type::Type{<:AbstractPublicGoodsGame}`: public goods game type 
- `player::Greedy`: an abstract player type 
- `contributions::Dict`: each player's contribution: id => contribution

# Returns

- nothing
"""
function observe_contributions!(
    game_type::Type{<:AbstractPublicGoodsGame},
    player::Greedy,
    contributions::Dict
)
    return nothing
end

"""
    observe_punishments!(
        game_type::Type{<:AbstractPublicGoodsGame},
        player::Greedy,
        punisher_id::T,
        punishment::Dict{T, N}
    ) 

Optionally observe the punishments from the punisher.

# Arguments

- `game_type::Type{<:AbstractPublicGoodsGame}`: public goods game type 
- `player::Greedy`: an abstract player type 
- `contributions::Dict{T,N}`: each player's contribution: id => contribution

# Returns

- nothing
"""
function observe_punishments!(
    game_type::Type{<:AbstractPublicGoodsGame},
    player::Greedy,
    punisher_id::T,
    punishment::Dict{T, N}
) where {T, N}
    return nothing
end

"""
    punish(game_type::Type{<:AbstractPublicGoodsGame}, player::Greedy, ids)

Optionally setup player before playing iterated public goods game.

# Arguments

- `game_type::Type{<:AbstractPublicGoodsGame}`: public goods game type 
- `player::Greedy`: an abstract player type 

# Returns

- `punishments::Dict{T, Float64}`: punishment amount associated with each player: id => punishment
"""
function punish(game_type::Type{<:AbstractPublicGoodsGame}, player::Greedy)
    return Dict(id => 0.0 for id ∈ player.ids)
end

"""
    observe_total_money!(
        game_type::Type{<:AbstractPublicGoodsGame},
        player::Greedy,
        total_money::Dict
    )

Optionally observe the total money of all players.

# Arguments

- `game_type::Type{<:AbstractPublicGoodsGame}`: public goods game type 
- `player::Greedy`: an abstract player type 
- `contributions::Dict`: each player's contribution: id => contribution

# Returns

- nothing
"""
function observe_total_money!(
    game_type::Type{<:AbstractPublicGoodsGame},
    player::Greedy,
    total_money::Dict
)
    return nothing
end
