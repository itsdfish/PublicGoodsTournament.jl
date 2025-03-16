@testitem "update_money" begin
    using PublicGoodsTournement
    using PublicGoodsTournement: update_money!
    using Test
    include("test_utilities.jl")

    ids = (:sloth, :chunk, :danzig)
    game_config = (
        public_goods_multiplier = 2,
        trial_start_amount = 10.0,
        max_punishment_amount = 10.0
    )
    game = PublicGoodsGame(; ids, game_config...)
    game.total_money[:sloth] = 10
    game.total_money[:chunk] = 15
    game.total_money[:danzig] = 5

    player = Player(:sloth, 10)
    contributions = Dict(
        :sloth => 1,
        :chunk => 7,
        :danzig => 7
    )

    update_money!(game, contributions)

    @test game.total_money[:sloth] ≈ (10 + 10 - 1 + 10)
    @test game.total_money[:chunk] ≈ (15 + 10 - 7 + 10)
    @test game.total_money[:danzig] ≈ (5 + 10 - 7 + 10)
end
