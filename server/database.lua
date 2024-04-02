function Database() 
    local self = {}

    self.Init = function()
        exports.oxmysql:executeSync(
            [[
                CREATE TABLE IF NOT EXISTS player_characters (
                    id INT AUTO_INCREMENT,
                    license VARCHAR(255) NOT NULL,
                    character_id INT NOT NULL,

                    citizen_id VARCHAR(50) NOT NULL,
                    character_info LONGTEXT NOT NULL,

                    PRIMARY KEY (`id`),
                    KEY `citizenid` (`citizen_id`)
                    
                );
            ]]
        )
    end

    self.GetPlayerData = function(citizenId)
        local result = exports.oxmysql:executeSync('SELECT * FROM player_characters WHERE citizen_id = ?', {citizenId})
        if result[1] == nil then
            return nil
        end
        return result[1]
    end

    return self
end