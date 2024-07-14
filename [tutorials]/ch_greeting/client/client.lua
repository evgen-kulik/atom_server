AddEventHandler('playerSpawned', function()
    TriggerServerEvent('ch_greeting:show')
end)

RegisterCommand('testGreeting', function()
    TriggerServerEvent('ch_greeting:show')
end)
