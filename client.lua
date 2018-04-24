POS_actual = 1


function loadout(pos)
    local ped = GetPlayerPed(-1)
    Citizen.CreateThread(function()
		RemoveAllPedWeapons(ped)
			for i,weap in pairs(LOADOUTS[pos.id].weapon) do
				GiveWeaponToPed(ped, weap, 1000, false)
				for COMPONENTS do
					if (component.weapon == weap && component.loadout=pos.id) then
						GiveWeaponComponentToPed(ped, weap, component.id) 
					end
				end
					-- for i,comp in pairs(LOADOUTS[pos.id].component) do    -- Gives the wrong component to some weapons
					--	GiveWeaponComponentToPed(ped, weap, comp) 
					--end
			end
			
    end)
end


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        local ped = GetPlayerPed(-1)
        local playerPos = GetEntityCoords(ped, true)

        for i,pos in pairs(WEAPONSHOPS) do
            DrawMarker(1, pos.x, pos.y, pos.z-1, 0, 0, 0, 0, 0, 0, 1.0,1.0,0.5, 255,0,0, 200, 0, 0, 2, 0, 0, 0, 0)
            if (Vdist(playerPos.x, playerPos.y, playerPos.z, pos.x, pos.y, pos.z) < 1.0) then
                POS_actual = pos.id
                if not gui_loadouts.opened then
                    gui_loadouts_OpenMenu()
                end
            end
        end
    end
end)