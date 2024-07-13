-- command to go to another player
RegisterCommand('goto', function(_, args)
    local targetID = args[1]

    if not targetID then
        TriggerEvent('chat:addMessage', {
            args = { 'Please provide a target ID.' },
        })

        return
    end

    TriggerServerEvent('ch_teleporter:goto', targetID)
end)

-- command to bring a player to UseFakeMpCash
RegisterCommand('summon', function(_, args)
    local targetID = args[1]

    if not targetID then
        TriggerEvent('chat:addMessage', {
            args = { "Please provide a target ID.", }
        })

        return
    end

    TriggerServerEvent('ch_teleporter:summon', targetID)
    
end)
