var documenterSearchIndex = {"docs":
[{"location":"api/#Types","page":"API","title":"Types","text":"","category":"section"},{"location":"api/","page":"API","title":"API","text":"Modules = [PublicGoodsTournement]\nOrder   = [:type]","category":"page"},{"location":"api/#PublicGoodsTournement.AbstractPlayer","page":"API","title":"PublicGoodsTournement.AbstractPlayer","text":"AbstractPlayer\n\nAn abstract player type for the public goods game. Subtypes of this abstract type must have the following fields\n\nFields\n\nid: unique player id \ntrial_start_money::Float64: the amount of money at the beginning of a trial\n\n\n\n\n\n","category":"type"},{"location":"api/#PublicGoodsTournement.AbstractPublicGoodsGame","page":"API","title":"PublicGoodsTournement.AbstractPublicGoodsGame","text":"AbstractPublicGoodsGame\n\nAn abstract public goods game object which expects the following fields.\n\nFields\n\ntotal_money::Dict{T, Float64}: the total amount of money for each player\npublic_goods_multiplier::Float64: the amount by which pooled contributions are multipled\ntrial_start_money: the amount of money given to an player at the begining of each trial\nmax_punishment_amount::Float64: the maximum amount that an player can punish on any given trial\n\n\n\n\n\n","category":"type"},{"location":"api/#PublicGoodsTournement.Chris","page":"API","title":"PublicGoodsTournement.Chris","text":"Chris <: AbstractPlayer\n\nA player type for the iterated public goods game. The API requireds the following  fields, but more can be added to support your player's strategy.\n\nFields\n\nid::Symbol: a unique name for the player \ntrial_start_money: the money provided at the begining of each trial \ntotal_money: the cumulative money earned across completed trials \n\n\n\n\n\n","category":"type"},{"location":"api/#PublicGoodsTournement.Cuck","page":"API","title":"PublicGoodsTournement.Cuck","text":"Cuck <: AbstractPlayer\n\nA Cuck type for the iterated public goods game. The chuck contributes its entire trial endowment to the public good  and does not punish. \n\nFields\n\nid::Symbol: a unique name for the player \ntrial_start_money: the money provided at the begining of each trial \ntotal_money: the cumulative money earned across completed trials \n\n\n\n\n\n","category":"type"},{"location":"api/#PublicGoodsTournement.Dad","page":"API","title":"PublicGoodsTournement.Dad","text":"Dad <: AbstractPlayer\n\nA player type for the iterated public goods game. The API requireds the following  fields, but more can be added to support your player's strategy.\n\nFields\n\nid::Symbol: a unique name for the player \ntrial_start_money: the money provided at the begining of each trial \ntotal_money: the cumulative money earned across completed trials \n\n\n\n\n\n","category":"type"},{"location":"api/#PublicGoodsTournement.DoucheBag","page":"API","title":"PublicGoodsTournement.DoucheBag","text":"DoucheBag <: AbstractPlayer\n\nA DoucheBag type for the iterated public goods game. The douche bag contributes no money to the public good  and punishes other players indiscriminantly. \n\nFields\n\nid::Symbol: a unique name for the player \ntrial_start_money: the money provided at the begining of each trial \ntotal_money: the cumulative money earned across completed trials \n\n\n\n\n\n","category":"type"},{"location":"api/#PublicGoodsTournement.Mary","page":"API","title":"PublicGoodsTournement.Mary","text":"Mary <: AbstractPlayer\n\nA player type for the iterated public goods game. The API requireds the following  fields, but more can be added to support your player's strategy.\n\nFields\n\nid::Symbol: a unique name for the player \ntrial_start_money: the money provided at the begining of each trial \ntotal_money: the cumulative money earned across completed trials \n\n\n\n\n\n","category":"type"},{"location":"api/#PublicGoodsTournement.Papi","page":"API","title":"PublicGoodsTournement.Papi","text":"Papi <: AbstractPlayer\n\nA player type for the iterated public goods game. The API requireds the following  fields, but more can be added to support your player's strategy.\n\nFields\n\nid::Symbol: a unique name for the player \ntrial_start_money: the money provided at the begining of each trial \ntotal_money: the cumulative money earned across completed trials \n\n\n\n\n\n","category":"type"},{"location":"api/#PublicGoodsTournement.PublicGoodsGame","page":"API","title":"PublicGoodsTournement.PublicGoodsGame","text":"PublicGoodsGame{T} <: AbstractPublicGoodsGame\n\nA standard public goods game object with the option for punishment. Punishments are deducted from an player's  total money  \n\nFields\n\ntotal_money::Dict{T, Float64}: the total amount of money for each player\npublic_goods_multiplier::Float64: the amount by which pooled contributions are multipled\ntrial_start_money: the amount of money given to an player at the begining of each trial\nmax_punishment_amount::Float64: the maximum amount that an player can punish on any given trial\n\nConstructors\n\nPublicGoodsGame(;     ids,     publicgoodsmultiplier,     trialstartmoney,     maxpunishmentamount )\n\nPublicGoodsGame(     totalmoney,     publicgoodsmultiplier,     trialstartmoney,     maxpunishment_amount )\n\n\n\n\n\n","category":"type"},{"location":"api/#Public-Functions","page":"API","title":"Public Functions","text":"","category":"section"},{"location":"api/","page":"API","title":"API","text":"Modules = [PublicGoodsTournement]\nOrder   = [:function]\nPrivate = false","category":"page"},{"location":"api/#PublicGoodsTournement.contribute-Tuple{Type{<:AbstractPublicGoodsGame}, AbstractPlayer}","page":"API","title":"PublicGoodsTournement.contribute","text":"contribute(game_type::Type{<:AbstractPublicGoodsGame}, player::AbstractPlayer)\n\nContribute to the public good.\n\nArguments\n\ngame_type::Type{<:AbstractPublicGoodsGame}: public goods game type \nplayer::AbstractPlayer: an abstract player type \n\nReturns\n\ncontribution::Float64: the amount contributed to the public good\n\n\n\n\n\n","category":"method"},{"location":"api/#PublicGoodsTournement.contribute-Tuple{Type{<:AbstractPublicGoodsGame}, Chris}","page":"API","title":"PublicGoodsTournement.contribute","text":"contribute(game_type::Type{<:AbstractPublicGoodsGame}, player::Chris)\n\nContribute to the public good.\n\nArguments\n\ngame_type::Type{<:AbstractPublicGoodsGame}: public goods game type \nplayer::Chris: an abstract player type \n\nReturns\n\ncontribution::Float64: the amount contributed to the public good\n\n\n\n\n\n","category":"method"},{"location":"api/#PublicGoodsTournement.contribute-Tuple{Type{<:AbstractPublicGoodsGame}, Cuck}","page":"API","title":"PublicGoodsTournement.contribute","text":"contribute(game_type::Type{<:AbstractPublicGoodsGame}, player::Cuck)\n\nContribute to the public good.\n\nArguments\n\ngame_type::Type{<:AbstractPublicGoodsGame}: public goods game type \nplayer::Cuck: an abstract player type \n\nReturns\n\ncontribution::Float64: the amount contributed to the public good\n\n\n\n\n\n","category":"method"},{"location":"api/#PublicGoodsTournement.contribute-Tuple{Type{<:AbstractPublicGoodsGame}, Dad}","page":"API","title":"PublicGoodsTournement.contribute","text":"contribute(game_type::Type{<:AbstractPublicGoodsGame}, player::Dad)\n\nContribute to the public good.\n\nArguments\n\ngame_type::Type{<:AbstractPublicGoodsGame}: public goods game type \nplayer::Dad: an abstract player type \n\nReturns\n\ncontribution::Float64: the amount contributed to the public good\n\n\n\n\n\n","category":"method"},{"location":"api/#PublicGoodsTournement.contribute-Tuple{Type{<:AbstractPublicGoodsGame}, DoucheBag}","page":"API","title":"PublicGoodsTournement.contribute","text":"contribute(game_type::Type{<:AbstractPublicGoodsGame}, player::DoucheBag)\n\nContribute to the public good.\n\nArguments\n\ngame_type::Type{<:AbstractPublicGoodsGame}: public goods game type \nplayer::DoucheBag: an abstract player type \n\nReturns\n\ncontribution::Float64: the amount contributed to the public good\n\n\n\n\n\n","category":"method"},{"location":"api/#PublicGoodsTournement.contribute-Tuple{Type{<:AbstractPublicGoodsGame}, Mary}","page":"API","title":"PublicGoodsTournement.contribute","text":"contribute(game_type::Type{<:AbstractPublicGoodsGame}, player::Mary)\n\nContribute to the public good.\n\nArguments\n\ngame_type::Type{<:AbstractPublicGoodsGame}: public goods game type \nplayer::Mary: an abstract player type \n\nReturns\n\ncontribution::Float64: the amount contributed to the public good\n\n\n\n\n\n","category":"method"},{"location":"api/#PublicGoodsTournement.contribute-Tuple{Type{<:AbstractPublicGoodsGame}, Papi}","page":"API","title":"PublicGoodsTournement.contribute","text":"contribute(game_type::Type{<:AbstractPublicGoodsGame}, player::Papi)\n\nContribute to the public good.\n\nArguments\n\ngame_type::Type{<:AbstractPublicGoodsGame}: public goods game type \nplayer::Papi: an abstract player type \n\nReturns\n\ncontribution::Float64: the amount contributed to the public good\n\n\n\n\n\n","category":"method"},{"location":"api/#PublicGoodsTournement.observe_punishments!-Union{Tuple{T}, Tuple{Type{<:AbstractPublicGoodsGame}, AbstractPlayer, T, Dict{T, Float64}}} where T","page":"API","title":"PublicGoodsTournement.observe_punishments!","text":"observe_punishments!(\n    game_type::Type{<:AbstractPublicGoodsGame},\n    player::AbstractPlayer,\n    punisher_id::T,\n    punishment::Dict{T, Float64}\n)\n\nOptionally observe the punishments from the punisher.\n\nArguments\n\ngame_type::Type{<:AbstractPublicGoodsGame}: public goods game type \nplayer::AbstractPlayer: an abstract player type \ncontributions::Dict{T,Float64}: each player's contribution: id => contribution\n\nReturns\n\nnothing\n\n\n\n\n\n","category":"method"},{"location":"api/#PublicGoodsTournement.observe_punishments!-Union{Tuple{T}, Tuple{Type{<:AbstractPublicGoodsGame}, Chris, T, Dict{T, Float64}}} where T","page":"API","title":"PublicGoodsTournement.observe_punishments!","text":"observe_punishments!(\n    game_type::Type{<:AbstractPublicGoodsGame},\n    player::Chris,\n    punisher_id::T,\n    punishment::Dict{T, Float64}\n)\n\nOptionally observe the punishments from the punisher.\n\nArguments\n\ngame_type::Type{<:AbstractPublicGoodsGame}: public goods game type \nplayer::Chris: an abstract player type \ncontributions::Dict{T,Float64}: each player's contribution: id => contribution\n\nReturns\n\nnothing\n\n\n\n\n\n","category":"method"},{"location":"api/#PublicGoodsTournement.observe_punishments!-Union{Tuple{T}, Tuple{Type{<:AbstractPublicGoodsGame}, Cuck, T, Dict{T, Float64}}} where T","page":"API","title":"PublicGoodsTournement.observe_punishments!","text":"observe_punishments!(\n    game_type::Type{<:AbstractPublicGoodsGame},\n    player::Cuck,\n    punisher_id::T,\n    punishment::Dict{T, Float64}\n)\n\nOptionally observe the punishments from the punisher.\n\nArguments\n\ngame_type::Type{<:AbstractPublicGoodsGame}: public goods game type \nplayer::Cuck: an abstract player type \ncontributions::Dict{T,Float64}: each player's contribution: id => contribution\n\nReturns\n\nnothing\n\n\n\n\n\n","category":"method"},{"location":"api/#PublicGoodsTournement.observe_punishments!-Union{Tuple{T}, Tuple{Type{<:AbstractPublicGoodsGame}, Dad, T, Dict{T, Float64}}} where T","page":"API","title":"PublicGoodsTournement.observe_punishments!","text":"observe_punishments!(\n    game_type::Type{<:AbstractPublicGoodsGame},\n    player::Dad,\n    punisher_id::T,\n    punishment::Dict{T, Float64}\n)\n\nOptionally observe the punishments from the punisher.\n\nArguments\n\ngame_type::Type{<:AbstractPublicGoodsGame}: public goods game type \nplayer::Dad: an abstract player type \ncontributions::Dict{T,Float64}: each player's contribution: id => contribution\n\nReturns\n\nnothing\n\n\n\n\n\n","category":"method"},{"location":"api/#PublicGoodsTournement.observe_punishments!-Union{Tuple{T}, Tuple{Type{<:AbstractPublicGoodsGame}, DoucheBag, T, Dict{T, Float64}}} where T","page":"API","title":"PublicGoodsTournement.observe_punishments!","text":"observe_punishments!(\n    game_type::Type{<:AbstractPublicGoodsGame},\n    player::DoucheBag,\n    punisher_id::T,\n    punishment::Dict{T, Float64}\n)\n\nOptionally observe the punishments from the punisher.\n\nArguments\n\ngame_type::Type{<:AbstractPublicGoodsGame}: public goods game type \nplayer::DoucheBag: an abstract player type \ncontributions::Dict{T,Float64}: each player's contribution: id => contribution\n\nReturns\n\nnothing\n\n\n\n\n\n","category":"method"},{"location":"api/#PublicGoodsTournement.observe_punishments!-Union{Tuple{T}, Tuple{Type{<:AbstractPublicGoodsGame}, Mary, T, Dict{T, Float64}}} where T","page":"API","title":"PublicGoodsTournement.observe_punishments!","text":"observe_punishments!(\n    game_type::Type{<:AbstractPublicGoodsGame},\n    player::Mary,\n    punisher_id::T,\n    punishment::Dict{T, Float64}\n)\n\nOptionally observe the punishments from the punisher.\n\nArguments\n\ngame_type::Type{<:AbstractPublicGoodsGame}: public goods game type \nplayer::Mary: an abstract player type \ncontributions::Dict{T,Float64}: each player's contribution: id => contribution\n\nReturns\n\nnothing\n\n\n\n\n\n","category":"method"},{"location":"api/#PublicGoodsTournement.observe_punishments!-Union{Tuple{T}, Tuple{Type{<:AbstractPublicGoodsGame}, Papi, T, Dict{T, Float64}}} where T","page":"API","title":"PublicGoodsTournement.observe_punishments!","text":"observe_punishments!(\n    game_type::Type{<:AbstractPublicGoodsGame},\n    player::Papi,\n    punisher_id::T,\n    punishment::Dict{T, Float64}\n)\n\nOptionally observe the punishments from the punisher.\n\nArguments\n\ngame_type::Type{<:AbstractPublicGoodsGame}: public goods game type \nplayer::Papi: an abstract player type \ncontributions::Dict{T,Float64}: each player's contribution: id => contribution\n\nReturns\n\nnothing\n\n\n\n\n\n","category":"method"},{"location":"api/#PublicGoodsTournement.punish-Tuple{Type{<:AbstractPublicGoodsGame}, AbstractPlayer, Any}","page":"API","title":"PublicGoodsTournement.punish","text":"punish(game_type::Type{<:AbstractPublicGoodsGame}, player::AbstractPlayer, ids)\n\nOptionally setup player before playing iterated public goods game.\n\nArguments\n\ngame_type::Type{<:AbstractPublicGoodsGame}: public goods game type \nplayer::AbstractPlayer: an abstract player type \nids: a collection of player ids \n\nReturns\n\npunishments::Dict{T, Float64}: punishment amount associated with each player: id => punishment\n\n\n\n\n\n","category":"method"},{"location":"api/#PublicGoodsTournement.punish-Tuple{Type{<:AbstractPublicGoodsGame}, Chris, Any}","page":"API","title":"PublicGoodsTournement.punish","text":"punish(game_type::Type{<:AbstractPublicGoodsGame}, player::Chris, ids)\n\nOptionally setup player before playing iterated public goods game.\n\nArguments\n\ngame_type::Type{<:AbstractPublicGoodsGame}: public goods game type \nplayer::Chris: an abstract player type \nids: a collection of player ids \n\nReturns\n\npunishments::Dict{T, Float64}: punishment amount associated with each player: id => punishment\n\n\n\n\n\n","category":"method"},{"location":"api/#PublicGoodsTournement.punish-Tuple{Type{<:AbstractPublicGoodsGame}, Cuck, Any}","page":"API","title":"PublicGoodsTournement.punish","text":"punish(game_type::Type{<:AbstractPublicGoodsGame}, player::Cuck, ids)\n\nOptionally setup player before playing iterated public goods game.\n\nArguments\n\ngame_type::Type{<:AbstractPublicGoodsGame}: public goods game type \nplayer::Cuck: an abstract player type \nids: a collection of player ids \n\nReturns\n\npunishments::Dict{T, Float64}: punishment amount associated with each player: id => punishment\n\n\n\n\n\n","category":"method"},{"location":"api/#PublicGoodsTournement.punish-Tuple{Type{<:AbstractPublicGoodsGame}, Dad, Any}","page":"API","title":"PublicGoodsTournement.punish","text":"punish(game_type::Type{<:AbstractPublicGoodsGame}, player::Dad, ids)\n\nOptionally setup player before playing iterated public goods game.\n\nArguments\n\ngame_type::Type{<:AbstractPublicGoodsGame}: public goods game type \nplayer::Dad: an abstract player type \nids: a collection of player ids \n\nReturns\n\npunishments::Dict{T, Float64}: punishment amount associated with each player: id => punishment\n\n\n\n\n\n","category":"method"},{"location":"api/#PublicGoodsTournement.punish-Tuple{Type{<:AbstractPublicGoodsGame}, DoucheBag, Any}","page":"API","title":"PublicGoodsTournement.punish","text":"punish(game_type::Type{<:AbstractPublicGoodsGame}, player::DoucheBag, ids)\n\nOptionally setup player before playing iterated public goods game.\n\nArguments\n\ngame_type::Type{<:AbstractPublicGoodsGame}: public goods game type \nplayer::DoucheBag: an abstract player type \nids: a collection of player ids \n\nReturns\n\npunishments::Dict{T, Float64}: punishment amount associated with each player: id => punishment\n\n\n\n\n\n","category":"method"},{"location":"api/#PublicGoodsTournement.punish-Tuple{Type{<:AbstractPublicGoodsGame}, Mary, Any}","page":"API","title":"PublicGoodsTournement.punish","text":"punish(game_type::Type{<:AbstractPublicGoodsGame}, player::Mary, ids)\n\nOptionally setup player before playing iterated public goods game.\n\nArguments\n\ngame_type::Type{<:AbstractPublicGoodsGame}: public goods game type \nplayer::Mary: an abstract player type \nids: a collection of player ids \n\nReturns\n\npunishments::Dict{T, Float64}: punishment amount associated with each player: id => punishment\n\n\n\n\n\n","category":"method"},{"location":"api/#PublicGoodsTournement.punish-Tuple{Type{<:AbstractPublicGoodsGame}, Papi, Any}","page":"API","title":"PublicGoodsTournement.punish","text":"punish(game_type::Type{<:AbstractPublicGoodsGame}, player::Papi, ids)\n\nOptionally setup player before playing iterated public goods game.\n\nArguments\n\ngame_type::Type{<:AbstractPublicGoodsGame}: public goods game type \nplayer::Papi: an abstract player type \nids: a collection of player ids \n\nReturns\n\npunishments::Dict{T, Float64}: punishment amount associated with each player: id => punishment\n\n\n\n\n\n","category":"method"},{"location":"api/#Private-Functions","page":"API","title":"Private Functions","text":"","category":"section"},{"location":"api/","page":"API","title":"API","text":"Modules = [PublicGoodsTournement]\nOrder   = [:function]\nPrivate = true","category":"page"},{"location":"api/#PublicGoodsTournement.observe_contributions!-Union{Tuple{T}, Tuple{Type{<:AbstractPublicGoodsGame}, AbstractPlayer, Dict{T, Float64}}} where T","page":"API","title":"PublicGoodsTournement.observe_contributions!","text":"observe_contributions!(\n    game_type::Type{<:AbstractPublicGoodsGame},\n    player::AbstractPlayer,\n    contributions::Dict{T, Float64}\n)\n\nOptionally observe each players contribution.\n\nArguments\n\ngame_type::Type{<:AbstractPublicGoodsGame}: public goods game type \nplayer::AbstractPlayer: an abstract player type \ncontributions::Dict{T,Float64}: each player's contribution: id => contribution\n\nReturns\n\nnothing\n\n\n\n\n\n","category":"method"},{"location":"api/#PublicGoodsTournement.observe_contributions!-Union{Tuple{T}, Tuple{Type{<:AbstractPublicGoodsGame}, Chris, Dict{T, Float64}}} where T","page":"API","title":"PublicGoodsTournement.observe_contributions!","text":"observe_contributions!(\n    game_type::Type{<:AbstractPublicGoodsGame},\n    player::Chris,\n    contributions::Dict{T, Float64}\n)\n\nOptionally observe each players contribution.\n\nArguments\n\ngame_type::Type{<:AbstractPublicGoodsGame}: public goods game type \nplayer::Chris: an abstract player type \ncontributions::Dict{T,Float64}: each player's contribution: id => contribution\n\nReturns\n\nnothing\n\n\n\n\n\n","category":"method"},{"location":"api/#PublicGoodsTournement.observe_contributions!-Union{Tuple{T}, Tuple{Type{<:AbstractPublicGoodsGame}, Cuck, Dict{T, Float64}}} where T","page":"API","title":"PublicGoodsTournement.observe_contributions!","text":"observe_contributions!(\n    game_type::Type{<:AbstractPublicGoodsGame},\n    player::Cuck,\n    contributions::Dict{T, Float64}\n)\n\nOptionally observe each players contribution.\n\nArguments\n\ngame_type::Type{<:AbstractPublicGoodsGame}: public goods game type \nplayer::Cuck: an abstract player type \ncontributions::Dict{T,Float64}: each player's contribution: id => contribution\n\nReturns\n\nnothing\n\n\n\n\n\n","category":"method"},{"location":"api/#PublicGoodsTournement.observe_contributions!-Union{Tuple{T}, Tuple{Type{<:AbstractPublicGoodsGame}, Dad, Dict{T, Float64}}} where T","page":"API","title":"PublicGoodsTournement.observe_contributions!","text":"observe_contributions!(\n    game_type::Type{<:AbstractPublicGoodsGame},\n    player::Dad,\n    contributions::Dict{T, Float64}\n)\n\nOptionally observe each players contribution.\n\nArguments\n\ngame_type::Type{<:AbstractPublicGoodsGame}: public goods game type \nplayer::Dad: an abstract player type \ncontributions::Dict{T,Float64}: each player's contribution: id => contribution\n\nReturns\n\nnothing\n\n\n\n\n\n","category":"method"},{"location":"api/#PublicGoodsTournement.observe_contributions!-Union{Tuple{T}, Tuple{Type{<:AbstractPublicGoodsGame}, DoucheBag, Dict{T, Float64}}} where T","page":"API","title":"PublicGoodsTournement.observe_contributions!","text":"observe_contributions!(\n    game_type::Type{<:AbstractPublicGoodsGame},\n    player::DoucheBag,\n    contributions::Dict{T, Float64}\n)\n\nOptionally observe each players contribution.\n\nArguments\n\ngame_type::Type{<:AbstractPublicGoodsGame}: public goods game type \nplayer::DoucheBag: an abstract player type \ncontributions::Dict{T,Float64}: each player's contribution: id => contribution\n\nReturns\n\nnothing\n\n\n\n\n\n","category":"method"},{"location":"api/#PublicGoodsTournement.observe_contributions!-Union{Tuple{T}, Tuple{Type{<:AbstractPublicGoodsGame}, Mary, Dict{T, Float64}}} where T","page":"API","title":"PublicGoodsTournement.observe_contributions!","text":"observe_contributions!(\n    game_type::Type{<:AbstractPublicGoodsGame},\n    player::Mary,\n    contributions::Dict{T, Float64}\n)\n\nOptionally observe each players contribution.\n\nArguments\n\ngame_type::Type{<:AbstractPublicGoodsGame}: public goods game type \nplayer::Mary: an abstract player type \ncontributions::Dict{T,Float64}: each player's contribution: id => contribution\n\nReturns\n\nnothing\n\n\n\n\n\n","category":"method"},{"location":"api/#PublicGoodsTournement.observe_contributions!-Union{Tuple{T}, Tuple{Type{<:AbstractPublicGoodsGame}, Papi, Dict{T, Float64}}} where T","page":"API","title":"PublicGoodsTournement.observe_contributions!","text":"observe_contributions!(\n    game_type::Type{<:AbstractPublicGoodsGame},\n    player::Papi,\n    contributions::Dict{T, Float64}\n)\n\nOptionally observe each players contribution.\n\nArguments\n\ngame_type::Type{<:AbstractPublicGoodsGame}: public goods game type \nplayer::Papi: an abstract player type \ncontributions::Dict{T,Float64}: each player's contribution: id => contribution\n\nReturns\n\nnothing\n\n\n\n\n\n","category":"method"},{"location":"api/#PublicGoodsTournement.update_money!-Tuple{AbstractPublicGoodsGame, Dict, Dict}","page":"API","title":"PublicGoodsTournement.update_money!","text":"update_money!(game::AbstractPublicGoodsGame, players::Dict, contributions::Dict)\n\nUpdate total money for game and each agent.\n\nArguments\n\nGame:::AbstractPublicGoodsGame: public goods game type \nplayers::Dict: mapping of id to player objects: id => player\ncontributions::Dict: mapping of id to contributions: id => contribution\n\nReturns\n\nnothing\n\n\n\n\n\n","category":"method"},{"location":"","page":"Home","title":"Home","text":"CurrentModule = PublicGoodsTournement","category":"page"},{"location":"#PublicGoodsTournement","page":"Home","title":"PublicGoodsTournement","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"This repo contains code for running an iterative public goods game tournement between agents. Use the left panel to navigate the documentation.","category":"page"}]
}
