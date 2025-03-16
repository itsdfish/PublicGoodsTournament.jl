module PublicGoodsTournement

using Distributions 
using StatsBase

# abstract types 
export AbstractPlayer
export AbstractPublicGoodsGame

# player types
export Chris 
export Dad 
export Mary 
export Papi 

# player methods 
export contribute
export observe_outcome!
export punish
export setup!


include("api.jl")
include("chris.jl")
include("dad.jl")
include("mary.jl")
include("papi.jl")

end
