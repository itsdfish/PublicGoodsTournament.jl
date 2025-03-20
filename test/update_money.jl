@testitem "update_money" begin
    using PublicGoodsTournement
    using PublicGoodsTournement: update_money!
    using Test
    include("test_utilities.jl")

    ids = (:sloth, :chunk, :danzig)
    game_config = (
        public_goods_multiplier = 2,
        trial_start_money = 10.0,
        max_punishment_amount = 10.0
    )
    game = PublicGoodsGame(; ids, game_config...)
    game.total_money[:sloth] = 10
    game.total_money[:chunk] = 15
    game.total_money[:danzig] = 5

    players = Dict(
        :sloth => Player(:sloth, ids, 10.0, 0.0),
        :chunk => Player(:chunk, ids, 15.0, 0.0),
        :danzig => Player(:danzig, ids, 5.0, 0.0)
    )

    contributions = Dict(
        :sloth => 1,
        :chunk => 7,
        :danzig => 7
    )

    update_money!(game, players, contributions)

    @test game.total_money[:sloth] ≈ (10 + 10 - 1 + 10)
    @test game.total_money[:chunk] ≈ (15 + 10 - 7 + 10)
    @test game.total_money[:danzig] ≈ (5 + 10 - 7 + 10)

    @test players[:sloth].total_money ≈ (10 + 10 - 1 + 10)
    @test players[:chunk].total_money ≈ (15 + 10 - 7 + 10)
    @test players[:danzig].total_money ≈ (5 + 10 - 7 + 10)
end
