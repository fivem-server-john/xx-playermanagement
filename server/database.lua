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

    return self
end