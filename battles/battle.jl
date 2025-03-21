############################################################################################################
#                                         load packages
############################################################################################################
cd(@__DIR__)
using Pkg
Pkg.activate("..")
using Revise
using PublicGoodsTournement
using Random
############################################################################################################
#                                         set up games
############################################################################################################
# Random.seed!(451)
ids = (:dbag, :cuck, :Chris, :greedy, :erradic)
types = (DoucheBag, Cuck, Chris, Greedy, Erradic)
# optional keyword argumens for each player 
args = ((; ids), (; ids), (; ids), (; ids), (; ids))
# game configuration 
game_config = (
    public_goods_multiplier = 2,
    trial_start_money = 10,
    max_punishment_amount = Inf
)
# number of trials
n_trials = 100
# select the game type 
game_type = PublicGoodsGame
############################################################################################################
#                                         battle!
############################################################################################################
game = battle!(; n_trials, game_type, ids, types, args, game_config)
game.total_money
