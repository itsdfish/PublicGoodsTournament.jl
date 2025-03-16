module PublicGoodsTournement

# abstract types 
export AbstractPlayer
export AbstractPublicGoodsGame

# player types
export Chris
export Dad
export DoucheBag
export Mary
export Papi

# player methods 
export contribute
export observe_outcome!
export punish
export setup!

# game methods 
export PublicGoodsGame
export battle!

include("api.jl")
include("chris.jl")
include("dad.jl")
include("douche_bag.jl")
include("mary.jl")
include("papi.jl")
include("standard_game.jl")

end
