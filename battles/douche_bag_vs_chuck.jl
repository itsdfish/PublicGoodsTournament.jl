############################################################################################################
#                                         load packages
############################################################################################################
cd(@__DIR__)
using Pkg
Pkg.activate("..")
using Revise
using PublicGoodsTournement
using HypothesisTests
using Random
############################################################################################################
#                                         set up games
############################################################################################################
Random.seed!(451)
ids = (:dbag, :cuck)
types = (DoucheBag, Cuck)
# optional keyword argumens for each player 
args = ((; ids), (; ids))
# game configuration 
game_config = (
    public_goods_multiplier = 2,
    trial_start_money = 10,
    max_punishment_amount = Inf
)
# number of trials
n_trials = 100
############################################################################################################
#                                         battle!
############################################################################################################
game = battle!(; n_trials, game_type = PublicGoodsGame, ids, types, args, game_config)
game.total_money
