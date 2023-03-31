local dump = require("lib.inspect")

commands.add_command("cheatitems", nil, function(command)
    game.player.insert { name = "infinity-chest", count = 10 }
    game.player.insert { name = "infinity-pipe", count = 10 }
    game.player.insert { name = "electric-energy-interface", count = 50 }
end)

script.on_event(defines.events.on_gui_opened, function(event)
    if not event then return end
    if not event.entity then return end
    if event.entity.name ~= "oil-refinery" then return end
end)
