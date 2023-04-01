local dump = require("lib.inspect")
require("lib.globals")
require("lib.util")

commands.add_command("cheatitems", nil, function(command)
    game.player.insert { name = "infinity-chest", count = 10 }
    game.player.insert { name = "infinity-pipe", count = 10 }
    game.player.insert { name = "electric-energy-interface", count = 50 }
end)

script.on_event("mirror-entity", function(event)
    local player = game.players[event.player_index]
    if not player.selected then return end

    -- check if building has the CraftingPrototype
    if not player.selected.prototype.crafting_speed then return end

    local recipe = player.selected.get_recipe()
    if not recipe then return end

    if not (Contains(BaseNames, recipe.name) or Contains(BaseNames, string.sub(recipe.name, 1, -10))) then return end

    local newRecipeName = ""
    local recipeSuffix = string.sub(recipe.name, -9, -1)

    if recipeSuffix == MirroredSuffix then
        newRecipeName = string.sub(recipe.name, 1, -10)
    else
        newRecipeName = recipe.name .. MirroredSuffix
    end

    player.selected.set_recipe(newRecipeName)
end)
