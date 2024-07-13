-- RegisterCommand('+openhood', function()
--     local playerID = PlayerPedId()
--     local playerVehicle = GetVehiclePedIsIn(playerID, false)

--     if playerVehicle <= 0 then
--         return
--     end

--     if GetPedInVehicleSeat(playerVehicle, -1) ~= playerID then
--         return
--     end

--     if GetVehicleDoorAngleRatio(playerVehicle, 4) > 0.1 then
--         SetVehicleDoorShut(playerVehicle, 4, false)
--     else
--         SetVehicleDoorOpen(playerVehicle, 4, false, false)
--     end
-- end)

-- RegisterCommand('+opentrunk', function()
--     local playerID = PlayerPedId()
--     local playerVehicle = GetVehiclePedIsIn(playerID, false)

--     if playerVehicle <= 0 then
--         return
--     end

--     if GetPedInVehicleSeat(playerVehicle, -1) ~= playerID then
--         return
--     end

--     if GetVehicleDoorAngleRatio(playerVehicle, 5) > 0.1 then
--         SetVehicleDoorShut(playerVehicle, 5, false)
--     else
--         SetVehicleDoorOpen(playerVehicle, 5, false, false)
--     end
-- end)

-- RegisterKeyMapping('+openhood', 'Open Vehicle Hood', 'PAGEUP')
-- RegisterKeyMapping('+opentrunk', 'Open Vehicle Trunk', 'PAGEDOWN')


RegisterCommand('+openhood', function()
    local playerID = PlayerPedId()
    local playerVehicle = GetVehiclePedIsIn(playerID, false)

    if playerVehicle <= 0 then
        print("Player is not in a vehicle")
        return
    end

    if GetPedInVehicleSeat(playerVehicle, -1) ~= playerID then
        print("Player is not in the driver seat")
        return
    end

    if GetVehicleDoorAngleRatio(playerVehicle, 4) > 0.1 then
        SetVehicleDoorShut(playerVehicle, 4, false)
        print("Hood closed")
    else
        SetVehicleDoorOpen(playerVehicle, 4, false, false)
        print("Hood opened")
    end
end, false)

RegisterCommand('+opentrunk', function()
    local playerID = PlayerPedId()
    local playerVehicle = GetVehiclePedIsIn(playerID, false)

    if playerVehicle <= 0 then
        print("Player is not in a vehicle")
        return
    end

    if GetPedInVehicleSeat(playerVehicle, -1) ~= playerID then
        print("Player is not in the driver seat")
        return
    end

    if GetVehicleDoorAngleRatio(playerVehicle, 5) > 0.1 then
        SetVehicleDoorShut(playerVehicle, 5, false)
        print("Trunk closed")
    else
        SetVehicleDoorOpen(playerVehicle, 5, false, false)
        print("Trunk opened")
    end
end, false)

RegisterKeyMapping('+openhood', 'Open Vehicle Hood', 'keyboard', 'PAGEUP')
RegisterKeyMapping('+opentrunk', 'Open Vehicle Trunk', 'keyboard', 'PAGEDOWN')


-- CreateThread(function()
--     while true do
--         Wait(0)

--         local playerID = PlayerPedID()
--         local playerVehicle = GetVehiclePedIsIn(playerID, false)
        
--         if playerVehicle > 0 and GetPedInVehicleSeat(playerVehicle, -1) == playerID then
--             if IsControlJustReleased(0, 208) then
--                 if GetVehicleDoorAngleRatio(playerVehicle, 4) > 0.1 then 
--                     SetVehicleDoorShut(playerVehicle, 4, false)
--                 else
--                     SetVehicleDoorOpen(playerVehicle, 4, false, false)
--                 end
--             end

--             if IsControlJustReleased(0, 207) then
--                 if GetVehicleDoorAngleRatio(playerVehicle, 5) > 0.1 then 
--                     SetVehicleDoorShut(playerVehicle, 5, false)
--                 else
--                     SetVehicleDoorOpen(playerVehicle, 5, false, false)
--                 end
--             end
--         end
--     end
-- end)