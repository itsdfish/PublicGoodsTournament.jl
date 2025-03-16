
mutable struct DoucheBag <: AbstractPlayer
    id::Symbol
    trial_money::Float64
end

"""
    contribute(player::DoucheBag)

Contribute to the public good.

# Arguments

- `player::DoucheBag`: an abstract player type 

# Returns

- `contribution::Float64`: the amount contributed to the public good
"""
function contribute(player::DoucheBag)
end

"""
    observe_contributions!(
        player::DoucheBag,
        contributions::Dict{T, Float64}
    ) 

Optionally observe each players contribution.

# Arguments

- `player::DoucheBag`: an abstract player type 
- `contributions::Dict{T,Float64}`: each player's contribution: id => contribution

# Returns

- nothing
"""
function observe_contributions!(
    player::DoucheBag,
    contributions::Dict{T, Float64}
) where {T}
end

"""
observe_punishments!(
    player::DoucheBag,
    punisher_id::T,
    punishment::Dict{T, Float64}
) 

Optionally observe the punishments from the punisher.

# Arguments

- `player::DoucheBag`: an abstract player type 
- `contributions::Dict{T,Float64}`: each player's contribution: id => contribution

# Returns

- nothing
"""
function observe_punishments!(
    player::DoucheBag,
    punisher_id::T,
    punishment::Dict{T, Float64}
) where {T}
end

"""
    punish(player::DoucheBag, ids)

Optionally setup player before playing iterated public goods game.

# Arguments

- `player::DoucheBag`: an abstract player type 
- `ids`: a collection of player ids 

# Returns

- `punishments::Dict{T, Float64}`: punishment amount associated with each player: id => punishment
"""
function punish(player::DoucheBag, ids)
end

"""
    setup!(player::DoucheBag, ids, game_config)

Optionally setup player before playing iterated public goods game.

# Arguments

- `player::DoucheBag`: an abstract player type 
- `ids`: a collection of player ids 
- `game_config`: keyword arguments of game options
"""
function setup!(player::DoucheBag, ids, game_config)
end
