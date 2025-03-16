abstract type AbstractPlayer end 

abstract type AbstractPublicGoodsGame end

function battle!(game_type, ids, types, args)
    players = Dict(id => t(;id, a...) for (t,id,a) in zip(types,ids,args))
    game = game_type(ids)
    setup!(players, ids)
    compete!(game, players)
    return nothing
end

function battle!(game::AbstractPublicGoodsGame, players)
    for _ ∈ 1:n_trials 
        add_money!(players, game), value(players)
        contributions = contribute!(game, players)
        update_money!(game, contributions)
        observe_outcome!(players, game.multiplier, contributions)
        punish!(players, game)
    end
    return nothing
end

function contribute!(game::AbstractPublicGoodsGame, players::Dict{T,A}) where {T,A}
    contributions = Dict{T, Float64}()
    for (id, player) ∈ players 
        contribution = contribute(player, game.multiplier)
        contribution = validate_contribution(game, contribution)
        contributions[id] = contribution
    end
    return conbitutions
end

function punish(game::AbstractPublicGoodsGame, players::Dict{T,A}) where {T,A}
    punishments = Dict{T, Float64}()
    ids = keys(players)
    for (id, player) ∈ players 
        punishment = punish(player, ids)
        punishment = validate_punishment(game, punishment)
        contributions[id] = contribution
    end
    return conbitutions
end


function validate_contribution(game::AbstractPublicGoodsGame, contribution)
    if contribution < game.initial_trial_money
        return 0
    elseif contribution > game.initial_trial_money
        return game.initial_trial_money
    end
    return contribution
end

function add_money!(game::AbstractPublicGoodsGame, player::AbstractPlayer)
    player.trial_start_money = game.trial_start_money
    return nothing
end

function add_money!(game::AbstractPublicGoodsGame, players::Dict{T,A}) where {T,A}
    for (_, player) ∈ players
        add_money!(player, game)
    end
    return nothing
end

function contribute(player::AbstractPlayer, multiplier)

end

function observe_outcome!(player::AbstractPlayer, multiplier, contributions)
    
end

function punish(player::AbstractPlayer, ids)

end

function setup!(player::AbstractPlayer, ids)

end