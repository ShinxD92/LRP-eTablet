
local holdingTablet = true

RegisterCommand('tablet', function(source, args)
        if (holdingTablet==true) then
            TriggerEvent("tabletAnimation")
            print ("AnimacionTablet")
            print (holdingTablet)
            holdingTablet=false
        elseif (holdingTablet==false) then
            DeleteEntity(tab)
            ClearPedTasks(PlayerPedId())
            print ("AnimacionTablet")
            print (holdingTablet)
            holdingTablet=true
        end
end, false)

RegisterNetEvent("tabletAnimation")
AddEventHandler("tabletAnimation", function()
    local ped = GetPlayerPed(-1)
    if not IsEntityDead(ped) then
        if not IsEntityPlayingAnim(ped, "amb@world_human_seat_wall_tablet@female@idle_a", "idle_c", 3) then
            RequestAnimDict("amb@world_human_seat_wall_tablet@female@idle_a")
            while not HasAnimDictLoaded("amb@world_human_seat_wall_tablet@female@idle_a") do
                Citizen.Wait(100)
            end
            
            TaskPlayAnim(ped, "amb@world_human_seat_wall_tablet@female@idle_a", "idle_c", 8.0, -8, -1, 49, 0, 0, 0, 0)
            tab = CreateObject(GetHashKey("prop_cs_tablet"), 0, 0, 0, true, true, true)        ----0.12, 0.028, 0.001, 10.0, 175.0, 0.0, true, true, false, true, 1, true)   
            AttachEntityToEntity(tab, GetPlayerPed(-1), GetPedBoneIndex(GetPlayerPed(-1), 18905), 0.12, 0.05, 0.13, -10.5, 180.0, 180.0, true, true, false, true, 1, true)        
             Citizen.Wait(2000)
            SetCurrentPedWeapon(ped, GetHashKey("WEAPON_UNARMED"), true)
        end
    end
end)