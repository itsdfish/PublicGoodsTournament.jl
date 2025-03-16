using PublicGoodsTournement
using Documenter

DocMeta.setdocmeta!(PublicGoodsTournement, :DocTestSetup, :(using PublicGoodsTournement); recursive=true)

makedocs(;
    modules=[PublicGoodsTournement],
    authors="itsdfish <itsdfish@gmail.com> and contributors",
    sitename="PublicGoodsTournement.jl",
    format=Documenter.HTML(;
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)
