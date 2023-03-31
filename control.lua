local dump = require("lib.inspect")

commands.add_command("cheatitems", nil, function(command)
    game.player.insert { name = "infinity-chest", count = 10 }
    game.player.insert { name = "infinity-pipe", count = 10 }
    game.player.insert { name = "electric-energy-interface", count = 50 }
end)
