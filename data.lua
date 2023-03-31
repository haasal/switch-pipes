require("lib.util")
local dump = require("lib.inspect")

local function mirrorRecipe(baseName)
    local baseRecipe = data.raw["recipe"][baseName]
    local mirroredRecipe = Deepcopy(baseRecipe)

    mirroredRecipe.ingredients = Reverse(mirroredRecipe.ingredients)
    mirroredRecipe.results = Reverse(mirroredRecipe.results)

    mirroredRecipe.enabled = true
    mirroredRecipe.name = baseName .. "-mirrored"

    if baseName == "sulfur" then
        mirroredRecipe.localised_name = { "recipe-name.mirrored-recipe", { "item-name." .. baseName } }
    else
        mirroredRecipe.localised_name = { "recipe-name.mirrored-recipe", { "recipe-name." .. baseName } }
    end

    return mirroredRecipe
end

local baseNames = { "sulfur", "advanced-oil-processing", "heavy-oil-cracking", "light-oil-cracking",
    "basic-oil-processing", "coal-liquefaction" }

for _, baseName in ipairs(baseNames) do
    local mirroredRecipe = mirrorRecipe(baseName)
    data:extend { mirroredRecipe }
end
