# Example 

This example demonstrates how to create a Cuck player type. The cuck contributes its entire trial endowment to the public good regardless of the contributions of the players. The cuck never punishes other players for not contributing. 

## Custom Player Type


The first step is to create a type for the [`Cuck`](@ref) as shown below. At minimum, a sub-type of `AbstractPlayer` must have a field for id, a field for the ids of the other players, a field for each trial's endowment, and the total money accumulated. 

```julia 
mutable struct Cuck{T} <: AbstractPlayer
    id::Symbol
    ids::T
    trial_start_money::Float64
    total_money::Float64
end
```

### Constructor 

Each player type is associated with a contructor for creating instances of a player. The contructor below for the `Cuck` consists of the minimum required keyword arguments: the id of the Cuck, the ids of other players, and a `NamedTuple` of game configuration parameters. Additional keyword arguments created in the battle script (e.g., ) and passed to the constructor.

```julia
function Cuck(; id, ids, game_config)
    ids = setdiff(ids, [id])
    return Cuck(id, ids, 0.0, 0.0)
end
```

## Required Methods

Each Player type implement a method for `contribute` and `punish`, both of which are described in turn. 

### Contribute 

The function [`contribute`](@ref) returns a value representing the players contribution for a given trial. The generic `game_type` argument for `AbstractPublicGoodsGame` is the default for any game type. Additional, methods can be created for specific game types as needed. The second argument is the player for the `Cuck` type. The contribution must be greater than or equal to zero and no greater than the trial start money. The `Cuck` contributes the maximum amount regardless of the contributions made by other players.   

```julia
function contribute(game_type::Type{<:AbstractPublicGoodsGame}, player::Cuck)
    return player.trial_start_money
end
```

### Punish

The function [`punish`](@ref) allows a player to punish other players. As before, the generic `game_type` argument for `AbstractPublicGoodsGame` is the default for any game type. Additional, methods can be created for specific game types as needed. The output id a `Dict` that maps player id to punishment amount: id => punishment. As noted above, the `Cuck` does not punish the other players.

```julia
function punish(game_type::Type{<:AbstractPublicGoodsGame}, player::Cuck)
    return Dict(id => 0.0 for id ∈ player.ids)
end
```
## Optional Methods 

The API contains two option methods for observing contributions and punishments made by the other players. If these methods are not necessary, you may leave them empty or delete them altogether (in which case an empty method for `AbstractPlayer` is called).

### Observe Contributions

The function [`observe_contributions!`](@ref) provides the player with the information about contributions of the other players and is called after all contributions are made. The `Cuck`'s behavior does not depend on the contributions of others. Consequentially, it is left empty. However, you may add code to the function body, and track information by adding fields to your player type. 

```julia
function observe_contributions!(
    game_type::Type{<:AbstractPublicGoodsGame},
    player::Cuck,
    contributions::Dict
)

    return nothing
end
```

### Observe Punishments

The function [`observe_punishments!`](@ref) provides the player with the information about punishments of the other players and is called after all punishments are made. The punisher id is provided along with the punishments it made to other players. This method is called once per player per round, which provides all information about all punishments made. The `Cuck`'s behavior does not depend on the punishments of others. Consequentially, it is left empty. However, you may add code to the function body, and track information by adding fields to your player type. 
```julia
function observe_punishments!(
    game_type::Type{<:AbstractPublicGoodsGame},
    player::Cuck,
    punisher_id::T,
    punishment::Dict{T,N}
) where {T,N}

    return nothing
end
```
