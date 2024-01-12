function PLAYERMANAGEMENT_SERVER()
    local self = {}

    -- PLAYER --
    self.LoginPlayer = function(source, citizenId)
        return LoginPlayer(source, citizenId)
    end

    return self
end

exports('GetObject', function()
    return PLAYERMANAGEMENT_SERVER()
end)