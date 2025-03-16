@testitem "smoke test" begin
    using PublicGoodsTournement
    using Test
    include("test_utilities.jl")
    ids = (:player1, :player2)
    types = (Player, Player)
    # optional keyword argumens for each player 
    args = ((; ids), (; ids))
    # game configuration 
    game_config = (
        public_goods_multiplier = 2,
        trial_start_money = 10,
        max_punishment_amount = 10
    )
    # number of games
    n_trials = 10
    game = battle!(; n_trials, game_type = PublicGoodsGame, ids, types, args, game_config)
    @test game.total_money[:player1] == 110
    @test game.total_money[:player2] == 110
end
