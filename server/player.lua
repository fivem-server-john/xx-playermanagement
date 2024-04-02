
function Player(playerData)
    local self = {}

    self.citizenId = playerData.citizen_id
    self.characterInfo = playerData.character_info

    return self
end