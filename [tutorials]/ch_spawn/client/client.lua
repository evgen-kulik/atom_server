local spawnPos = vector3(686.245, 577.950, 130.461)

AddEventHandler('onClientResourceStart', function(resourceName)
    if resourceName == GetCurrentResourceName() then
        print("Event onClientResourceStart triggered for resource: " .. resourceName)
        
        exports.spawnmanager:setAutoSpawnCallback(function()
            print("Auto spawn callback triggered")
            
            exports.spawnmanager:spawnPlayer({
                x = spawnPos.x,
                y = spawnPos.y,
                z = spawnPos.z,
                model = 's_m_y_marine_01'
            }, function()
                print("Player spawned successfully")
                
                TriggerEvent('chat:addMessage', {
                    args = { 'Welcome to the party!~' }
                })
            end)
        end)

        exports.spawnmanager:setAutoSpawn(true)
        print("Auto spawn set to true")
        
        exports.spawnmanager:forceRespawn()
        print("Force respawn triggered")
    end
end)

print("Script loaded")
