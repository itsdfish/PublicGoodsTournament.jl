"""
    PublicGoodsGame{T} <: AbstractPublicGoodsGame

A standard public goods game object with the option for punishment. Punishments are deducted from an player's 
total money  

# Fields 

- `total_money::Dict{T, Float64}`: the total amount of money for each player
- `public_goods_multiplier::Float64`: the amount by which pooled contributions are multipled
- `trial_start_money`: the amount of money given to an player at the begining of each trial
- `max_punishment_amount::Float64`: the maximum amount that an player can punish on any given trial

# Constructors 

PublicGoodsGame(;
    ids,
    public_goods_multiplier,
    trial_start_money,
    max_punishment_amount
)

PublicGoodsGame(
    total_money,
    public_goods_multiplier,
    trial_start_money,
    max_punishment_amount
)

"""
mutable struct PublicGoodsGame{T, N <: Number} <: AbstractPublicGoodsGame
    total_money::Dict{T, N}
    public_goods_multiplier::N
    trial_start_money::N
    max_punishment_amount::N
end

function PublicGoodsGame(;
    ids,
    public_goods_multiplier,
    trial_start_money,
    max_punishment_amount
)
    args = promote(public_goods_multiplier, trial_start_money, max_punishment_amount)
    total_money = Dict(id => zero(eltype(args)) for id ∈ ids)

    return PublicGoodsGame(total_money, args...)
end
