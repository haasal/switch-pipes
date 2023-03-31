require("lib.util")
local dump = require("lib.inspect")

local function permute(a, n, result)
    n = n or #a
    result = result or {}
    if n == 0 then
        table.insert(result, Deepcopy(a))
    else
        for i = 1, n do
            a[n], a[i] = a[i], a[n]
            permute(a, n - 1, result)
            a[n], a[i] = a[i], a[n]
        end
    end
    return result
end

local function generate_permutations(N)
    local a = {}
    for i = 1, N do
        a[i] = i
    end
    return permute(a)
end

local function apply_permutation(arr, permutation)
    local result = {}
    for i = 1, #permutation do
        result[i] = arr[permutation[i]]
    end
    return result
end

local function makePermutedRecipe(baseName, baseRecipe, permutation)
    local permutedRecipe = Deepcopy(baseRecipe)

    permutedRecipe.results = apply_permutation(permutedRecipe.results, permutation)

    local suffix = "-"
    for _, permIndex in ipairs(permutation) do
        suffix = suffix .. permIndex
    end

    permutedRecipe.name = baseName .. suffix
    permutedRecipe.enabled = true -- TODO: disable
    permutedRecipe.localised_name = { "recipe-name." .. baseName }

    return permutedRecipe
end

local function extendPermutedRecipes(baseName)
    local baseRecipe = data.raw["recipe"][baseName]
    local numberResults = #baseRecipe.results

    for _, permutation in ipairs(generate_permutations(numberResults)) do
        local recipe = makePermutedRecipe(baseName, baseRecipe, permutation)
        data:extend { recipe }
    end
end

local baseName = "advanced-oil-processing"

extendPermutedRecipes(baseName)
