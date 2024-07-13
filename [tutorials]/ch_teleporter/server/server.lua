RegisterNetEvent('ch_teleporter:goto', function(targetID)
    local playerID = source
    local playerPed = GetPlayerPed(playerID)
    local targetPed = GetPlayerPed(targetID)

    if targetPed <= 0 then
        TriggerClientEvent('chat:addMessage', playerID, {
            args = { 'Sorry, ' .. targetID .. ' doesn\'t seem to exist.', },
        })

        return
    end

    local targetPos = GetEntityCoords(targetPed)

    SetEntityCoords(playerPed, targetPos)
end)

RegisterNetEvent('ch_teleporter:summon', function(targetID)
    local playerID = source
    local playerPed = GetPlayerPed(playerID)
    local playerPos = GetEntityCoords(playerPed)
    local targetPed = GetPlayerPed(targetID)

    if targetPed <= 0 then
        TriggerClientEvent('chat:addMessage', playerID, {
            args = { 'Sorry, ' .. targetID .. ' doesn\'t seem to exist.', },
        })

        return
    end

    SetEntityCoords(targetPed, playerPos)
end)