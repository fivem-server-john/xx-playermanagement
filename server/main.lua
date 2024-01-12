local Players = {}
DATABASE = Database()

Citizen.CreateThread(function()

    DATABASE.Init()

end)

function LoginPlayer(source, citizenid)
    local newPlayer = Player(citizenid)

    ValidatePlayer(newPlayer, source)
end

function ValidatePlayer(player, source)

    -- Done validating player
    Players[source] = player

    print("Logged in player: " .. player.citizenid)
end