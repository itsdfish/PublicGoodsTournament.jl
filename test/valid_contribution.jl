@testitem "too small" begin
    using PublicGoodsTournement
    using PublicGoodsTournement: validate_contribution
    using Test
    include("test_utilities.jl")

    ids = (:sloth, :chunk)
    game_config = (
        public_goods_multiplier = 2,
        trial_start_money = 10.0,
        max_punishment_amount = 10.0
    )
    game = PublicGoodsGame(; ids, game_config...)
    player = Player(:sloth, 10)
    message = "$(player.id)'s contribution is too small. Minimum contribution is 0."
    @test_throws ErrorException(message) validate_contribution(game, player, -1)
end

@testitem "too large" begin
    using PublicGoodsTournement
    using PublicGoodsTournement: validate_contribution
    using Test
    include("test_utilities.jl")

    ids = (:sloth, :chunk)
    game_config = (
        public_goods_multiplier = 2,
        trial_start_money = 10.0,
        max_punishment_amount = 10.0
    )
    game = PublicGoodsGame(; ids, game_config...)
    player = Player(:sloth, 10)
    message = "$(player.id)'s contribution is too large. Maximum contribution is $(game.trial_start_money)."
    @test_throws ErrorException(message) validate_contribution(game, player, 11)
end

@testitem "contribution is valid 1" begin
    using PublicGoodsTournement
    using PublicGoodsTournement: validate_contribution
    using Test
    include("test_utilities.jl")

    ids = (:sloth, :chunk)
    game_config = (
        public_goods_multiplier = 2,
        trial_start_money = 10.0,
        max_punishment_amount = 10.0
    )
    game = PublicGoodsGame(; ids, game_config...)
    player = Player(:sloth, 10)
    @test isnothing(validate_contribution(game, player, 10))
end

@testitem "contribution is valid 1" begin
    using PublicGoodsTournement
    using PublicGoodsTournement: validate_contribution
    using Test
    include("test_utilities.jl")

    ids = (:sloth, :chunk)
    game_config = (
        public_goods_multiplier = 2,
        trial_start_money = 10.0,
        max_punishment_amount = 10.0
    )
    game = PublicGoodsGame(; ids, game_config...)
    player = Player(:sloth, 10)
    @test isnothing(validate_contribution(game, player, 0))
end
