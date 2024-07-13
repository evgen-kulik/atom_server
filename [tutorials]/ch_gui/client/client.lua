-- Advanced Notifications

function showAdvancedNotification(message, sender, subject, textureDict, iconType, saveToBrief, color)
    BeginTextCommandThefeedPost('STRING')
    AddTextComponentSubstringPlayerName(message)
    ThefeedSetNextPostBackgroundColor(color)
    EndTextCommandThefeedPostMessagetext(textureDict, textureDict, false, iconType, sender, subject)
    EndTextCommandThefeedPostTicker(false, saveToBrief)
end

RegisterCommand('testAdvancedNotification', function(_, _, rawCommand)
    showAdvancedNotification(
        rawCommand,
        'This is Sender',
        'This is Subject',
        'CHAR_AMMUNATION',
        8,
        true,
        130
    )
    
end)

-- Notifications

function showNotification(message, color, flash, saveToBrief)
    BeginTextCommandThefeedPost('STRING')
    AddTextComponentSubstringPlayerName(message)
    ThefeedSetNextPostBackgroundColor(color)
    EndTextCommandThefeedPostTicker(flash, saveToBrief)
end

RegisterCommand('testNotification', function(source, args, rawCommand)
    local message = table.concat(args, " ")  -- Объедините аргументы в одно сообщение
    showNotification(
        message,  -- Передайте сообщение в функцию showNotification
        130,
        true,
        true
    )
end)

-- Alerts

function showAlert(message, beep, duration)
    AddTextEntry('CH_ALERT', message)

    BeginTextCommandDisplayHelp('CH_ALERT')
    EndTextCommandDisplayHelp(0, false, beep, duration)
end

RegisterCommand('testAlert', function(_, _, rawCommand)
    showAlert(
        rawCommand,
        true,
        -1
    )
end)

-- Markers

RegisterCommand('testMarker', function()
    CreateThread(function()
        Wait(0)

        local start = GetGameTimer()

        while GetGameTimer() < (start + 10000) do  -- 10 sec.
            local playerCoordinates = GetEntityCoords(PlayerPedId())
            DrawMarker(
                 42,  -- Тип маркера https://docs.fivem.net/docs/game-references/markers/
                playerCoordinates.x,
                playerCoordinates.y,
                playerCoordinates.z + 1.5,  -- Поднятие маркера на 1 единицу по оси Z
                0.0, 0.0, 0.0,  -- Вектор смещения
                0.0, 0.0, 0.0,  -- Вектор вращения
                1.0, 1.0, 1.0,  -- Размеры маркера (ширина, высота, длина)
                0, 220, 180, 100,  -- Цвет маркера (R, G, B, Alpha)
                true,  -- Прыгает
                true,  -- Отображать на мини-карте
                2,  -- Тип вращения (2 - вращение по оси Z)
                false,  -- Текстура
                false,  -- Размеры текста
                false  -- Неотображение в 3D
            )
            Wait(0) -- Задержка для снижения нагрузки, иначе игра зависнет
        end
    end)
end)

-- Subtitles

function showSubtitle(message, duration)
    BeginTextCommandPrint('STRING')
    AddTextComponentString(message)
    EndTextCommandPrint(duration, true)
end

RegisterCommand('testSubtitle', function(_, _, rawCommand)
    showSubtitle(
        'Go to ~y~Fleeca~s~ and rob it.',
        10000
    )
end)

-- Busy Spinners

function showBusySpinner(message)
    BeginTextCommandBusyspinnerOn('STRING')
    AddTextComponentSubstringPlayerName(message)
    EndTextCommandBusyspinnerOn(5)  -- цифра=цвет значка счетчика
end

function hideBusySpinner()
    BusyspinnerOff()
end

RegisterCommand('testSpinner', function(_, _, rawCommand)
    if rawCommand == 'testSpinner' then
        hideBusySpinner()
    else
        showBusySpinner(rawCommand)
    end
end)

-- Text SetInputExclusive

function getTextInput(title, inputLength)
    AddTextEntry('CH_INPUT', title)
    DisplayOnscreenKeyboard(1, 'CH_INPUT', '', '', '', '', '', inputLength)

    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do 
        Citizen.Wait(0)
    end

    if UpdateOnscreenKeyboard() ~= 2 then
        local result = GetOnscreenKeyboardResult()

        Citizen.Wait(0)

        return result
    else
        Citizen.Wait(0)

        return nil
    end
end

RegisterCommand('testInput', function(_, _, rawCommand)
    local result = getTextInput(rawCommand, 30)

    showNotification(result, 180, false, false)
end)