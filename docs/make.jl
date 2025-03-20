using PublicGoodsTournement
using Documenter

makedocs(
    warnonly = true,
    sitename = "PublicGoodsTournement",
    format = Documenter.HTML(
        assets = [
            asset(
            "https://fonts.googleapis.com/css?family=Montserrat|Source+Code+Pro&display=swap",
            class = :css
        )
        ],
        collapselevel = 1
    ),
    modules = [
        PublicGoodsTournement
    # Base.get_extension(PublicGoodsTournement, :TuringExt),
    # Base.get_extension(PublicGoodsTournement, :NamedArraysExt)
    ],
    pages = [
        "Home" => "index.md",
        "Public Goods Games" => "public_goods_game.md",
        "Example" => "example.md",
        "API" => "api.md"
    ]
)

deploydocs(repo = "https://github.com/itsdfish/PublicGoodsTournament.jl.git")
