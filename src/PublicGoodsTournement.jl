module PublicGoodsTournement

# abstract types 
export AbstractPlayer
export AbstractPublicGoodsGame

# player types
export Chris
export Cuck
export Dad
export DoucheBag
export Mary
export Papi

# player methods 
export contribute
export observe_outcome!
export observe_punishments!
export observe_total_money!
export punish

# game methods 
export PublicGoodsGame
export battle!

include("api.jl")
include("game.jl")
include("chris.jl")
include("cuck.jl")
include("dad.jl")
include("douche_bag.jl")
include("mary.jl")
include("papi.jl")
include("standard_game.jl")

end
