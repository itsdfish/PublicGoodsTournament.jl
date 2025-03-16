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
ids = (:dbag1, :dbag2)
types = (DoucheBag, DoucheBag)
# optional keyword argumens for each player 
args = ((; ids), (; ids))
# game configuration 
game_config = (
    public_goods_multiplier = 2,
    trial_start_amount = 10,
    max_punishment_amount = 10
)
# number of games
n_games = 1000
############################################################################################################
#                                         battle!
############################################################################################################
battle!(; n_games, game_type = PublicGoodsGame, ids, types, args, game_config)
# chi-square goodness of fit test assuming no difference in player performance
@show test = ChisqTest(score)
@show pvalue(test)
game.money
