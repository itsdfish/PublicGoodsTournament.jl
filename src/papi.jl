mutable struct Papi <: AbstractPlayer
    id::Symbol
    trial_money::Float64
end

"""
    contribute(player::Papi)

Contribute to the public good.

# Arguments

- `player::Papi`: an abstract player type 

# Returns

- `contribution::Float64`: the amount contributed to the public good
"""
function contribute(player::Papi)
end

"""
    observe_contributions!(
        player::Papi,
        contributions::Dict{T, Float64}
    ) 

Optionally observe each players contribution.

# Arguments

- `player::Papi`: an abstract player type 
- `contributions::Dict{T,Float64}`: each player's contribution: id => contribution

# Returns

- nothing
"""
function observe_contributions!(
    player::Papi,
    contributions::Dict{T, Float64}
) where {T}
end

"""
observe_punishments!(
    player::Papi,
    punisher_id::T,
    punishment::Dict{T, Float64}
) 

Optionally observe the punishments from the punisher.

# Arguments

- `player::Papi`: an abstract player type 
- `contributions::Dict{T,Float64}`: each player's contribution: id => contribution

# Returns

- nothing
"""
function observe_punishments!(
    player::Papi,
    punisher_id::T,
    punishment::Dict{T, Float64}
) where {T}
end

"""
    punish(player::Papi, ids)

Optionally setup player before playing iterated public goods game.

# Arguments

- `player::Papi`: an abstract player type 
- `ids`: a collection of player ids 

# Returns

- `punishments::Dict{T, Float64}`: punishment amount associated with each player: id => punishment
"""
function punish(player::Papi, ids)
end

"""
    setup!(player::Papi, ids, game_config)

Optionally setup player before playing iterated public goods game.

# Arguments

- `player::Papi`: an abstract player type 
- `ids`: a collection of player ids 
- `game_config`: keyword arguments of game options
"""
function setup!(player::Papi, ids, game_config)
end
