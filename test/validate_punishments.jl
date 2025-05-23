@testitem "negative values" begin
    using PublicGoodsTournement
    using PublicGoodsTournement: validate_punishments
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
    player = Player(:sloth, ids, 10.0, 0.0)
    punishments = Dict(
        :sloth => -1,
        :chunk => 0,
        :danzig => 3
    )
    message = "$(player.id)'s punishments contain a negative value."
    @test_throws ErrorException(message) validate_punishments(game, player, punishments)
end

@testitem "total too large" begin
    using PublicGoodsTournement
    using PublicGoodsTournement: validate_punishments
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
    player = Player(:sloth, ids, 10.0, 0.0)
    punishments = Dict(
        :sloth => 8,
        :chunk => 0,
        :danzig => 7
    )
    message = "$(player.id)'s total punishment amount of 15 exceeds its total money of 10.0"
    @test_throws ErrorException(message) validate_punishments(game, player, punishments)
end

@testitem "negative with zero" begin
    using PublicGoodsTournement
    using PublicGoodsTournement: validate_punishments
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
    game.total_money[:chunk] = -10

    player = Player(:chunk, ids, 10.0, -10.0)
    punishments = Dict(
        :sloth => 0,
        :chunk => 0,
        :danzig => 0
    )
    message = "$(player.id)'s total punishment amount of 15 exceeds its total money of 10.0"
    @test isnothing(validate_punishments(game, player, punishments))
end

@testitem "above threshold" begin
    using PublicGoodsTournement
    using PublicGoodsTournement: validate_punishments
    using Test
    include("test_utilities.jl")

    ids = (:sloth, :chunk, :danzig)
    game_config = (
        public_goods_multiplier = 2,
        trial_start_money = 10.0,
        max_punishment_amount = 5.0
    )
    game = PublicGoodsGame(; ids, game_config...)
    game.total_money[:sloth] = 10
    player = Player(:sloth, ids, 10.0, 0.0)
    punishments = Dict(
        :sloth => 2,
        :chunk => 1,
        :danzig => 3
    )
    message = "$(player.id)'s total punishment amount of 6 exceeds the maximum punishment amount of 5.0"
    @test_throws ErrorException(message) validate_punishments(game, player, punishments)
end

@testitem "is valid" begin
    using PublicGoodsTournement
    using PublicGoodsTournement: validate_punishments
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
    player = Player(:sloth, ids, 10.0, 0.0)
    punishments = Dict(
        :sloth => 2,
        :chunk => 1,
        :danzig => 3
    )
    @test isnothing(validate_punishments(game, player, punishments))
end
