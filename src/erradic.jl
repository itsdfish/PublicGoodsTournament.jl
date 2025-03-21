"""
    Erradic <: AbstractPlayer

A Erradic type for the iterated public goods game. The chuck contributes its entire trial endowment to the public good 
and does not punish. 

# Fields

- `id::Symbol`: a unique name for the player 
- `ids::T`: a list of all player ids excluding player id
- `trial_start_money`: the money provided at the begining of each trial 
- `total_money`: the cumulative money earned across completed trials 
"""
mutable struct Erradic{T} <: AbstractPlayer
    id::Symbol
    ids::T
    trial_start_money::Float64
    total_money::Float64
end

"""
    Erradic(; id, ids, game_config)

A constructor for the Erradic player type. Additional keyword arguments can be added and passed via 
`args` in the function `battle!`.

# Keywords 

- `id`: the Erradic player id 
- `ids`: a list of all player ids excluding player id
- `game_config`: a set of keywords corresponding to parameters of the iterated public goods game
"""
function Erradic(; id, ids, game_config)
    ids = setdiff(ids, [id])
    return Erradic(id, ids, 0.0, 0.0)
end

"""
    contribute(game_type::Type{<:AbstractPublicGoodsGame}, player::Erradic)

Contribute to the public good.

# Arguments

- `game_type::Type{<:AbstractPublicGoodsGame}`: public goods game type 
- `player::Erradic`: an abstract player type 

# Returns

- `contribution::Float64`: the amount contributed to the public good
"""
function contribute(game_type::Type{<:AbstractPublicGoodsGame}, player::Erradic)
    return rand(Uniform(0, player.trial_start_money))
end

"""
    observe_contributions!(
        game_type::Type{<:AbstractPublicGoodsGame},
        player::Erradic,
        contributions::Dict
    ) 

Optionally observe each players contribution.

# Arguments

- `game_type::Type{<:AbstractPublicGoodsGame}`: public goods game type 
- `player::Erradic`: an abstract player type 
- `contributions::Dict`: each player's contribution: id => contribution

# Returns

- nothing
"""
function observe_contributions!(
    game_type::Type{<:AbstractPublicGoodsGame},
    player::Erradic,
    contributions::Dict
)
    return nothing
end

"""
    observe_punishments!(
        game_type::Type{<:AbstractPublicGoodsGame},
        player::Erradic,
        punisher_id::T,
        punishment::Dict{T, N}
    ) 

Optionally observe the punishments from the punisher.

# Arguments

- `game_type::Type{<:AbstractPublicGoodsGame}`: public goods game type 
- `player::Erradic`: an abstract player type 
- `contributions::Dict{T,N}`: each player's contribution: id => contribution

# Returns

- nothing
"""
function observe_punishments!(
    game_type::Type{<:AbstractPublicGoodsGame},
    player::Erradic,
    punisher_id::T,
    punishment::Dict{T, N}
) where {T, N}
    return nothing
end

"""
    punish(game_type::Type{<:AbstractPublicGoodsGame}, player::Erradic, ids)

Optionally setup player before playing iterated public goods game.

# Arguments

- `game_type::Type{<:AbstractPublicGoodsGame}`: public goods game type 
- `player::Erradic`: an abstract player type 

# Returns

- `punishments::Dict{T, Float64}`: punishment amount associated with each player: id => punishment
"""
function punish(game_type::Type{<:AbstractPublicGoodsGame}, player::Erradic)
    punishments = Dict(id => 0.0 for id ∈ player.ids)
    for (id, _) ∈ punishments
        rand() ≤ 0.50 ? continue : nothing
        punishment = rand(Uniform(0, player.total_money))
        player.total_money -= punishment
        punishments[id] = punishment
    end
    return punishments
end

"""
    observe_total_money!(
        game_type::Type{<:AbstractPublicGoodsGame},
        player::Erradic,
        total_money::Dict
    )

Optionally observe the total money of all players.

# Arguments

- `game_type::Type{<:AbstractPublicGoodsGame}`: public goods game type 
- `player::Erradic`: an abstract player type 
- `contributions::Dict`: each player's contribution: id => contribution

# Returns

- nothing
"""
function observe_total_money!(
    game_type::Type{<:AbstractPublicGoodsGame},
    player::Erradic,
    total_money::Dict
)
    return nothing
end
