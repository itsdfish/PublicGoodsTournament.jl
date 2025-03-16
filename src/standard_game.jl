mutable struct PublicGoodsGame{T} 
    money::Dict{T, Float64}
    multiplier::Float64
    trial_start_amount::Float64
    max_punishment_amount::Float64
end 