require("lib.util")
local dump = require("lib.inspect")

local function mirrorRecipe(baseName)
    local baseRecipe = data.raw["recipe"][baseName]
    local mirroredRecipe = Deepcopy(baseRecipe)

    mirroredRecipe.ingredients = Reverse(mirroredRecipe.ingredients)
    mirroredRecipe.results = Reverse(mirroredRecipe.results)

    mirroredRecipe.name = "mirrored-recipe"
    mirroredRecipe.enabled = true
    mirroredRecipe.localised_name = { "recipe-name.mirrored-recipe", { "recipe-name." .. baseName } }

    return mirroredRecipe
end


local baseName = "advanced-oil-processing"

local mirrored = mirrorRecipe(baseName)

data:extend { mirrored }
