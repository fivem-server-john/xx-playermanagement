local UTILS = exports['xx-utils']:GetObject()

local Players = {}
DATABASE = Database()

Citizen.CreateThread(function()

    DATABASE.Init()

end)

function LoginPlayer(source, citizenid)
    local src = source

    if not src then return false end
    if not citizenid then return false end

    local license = UTILS.GetPlayerIdentifierOfType(src, "license")
    local playerData = DATABASE.GetPlayerData(citizenid)

    if not playerData or playerData.license ~= license then
        return false
    end

    playerData.character_info = json.decode(playerData.character_info)

    ValidatePlayer(src, playerData)
end

function ValidatePlayer(source, playerData)
    local src = source

    -- Done validating player
    local newPlayer = Player(playerData)
    Players[src] = newPlayer

    print("Logged in player: " .. playerData.citizen_id)
end

function GetPlayerByServerId(source)
    local src = source

    if not Players[src] then return false end

    return Players[src]
end