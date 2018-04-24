POS_actual = 1


function loadout(pos)
    local ped = GetPlayerPed(-1)
    Citizen.CreateThread(function()
		RemoveAllPedWeapons(ped)
			for i,weap in pairs(LOADOUTS[pos.id].weapon) do
				GiveWeaponToPed(ped, weap, 1000, false)
				for i,component in  (COMPONENTS) do
					if (component.weapon == weap && component.loadout=pos.id) then
						GiveWeaponComponentToPed(ped, weap, component.id) 
					end
				end
					-- for i,comp in pairs(LOADOUTS[pos.id].component) do    -- Gives the wrong component to some weapons
					--	GiveWeaponComponentToPed(ped, weap, comp) 
					--end
			end
			

		--if (pos.id == 1) then -- Alexander
		--	--defaults
		--	GiveWeaponToPed(ped, 0x497FACC3, 300, false) --give flares
		--	
		--	GiveWeaponToPed(ped, 0x1B06D571, 300, false) --give pistol
		--	GiveWeaponToPed(ped, 0x22D8FE39, 300, false) --give AP pistol
		--	GiveWeaponToPed(ped, 0x13532244, 900, false) --give micro SMG
		--	GiveWeaponToPed(ped, 0x7FD62962, 800, false) --give combat MG
		--	GiveWeaponToPed(ped, 0xBFEFFF6D, 900, false) --give basic assault rifle
		--	GiveWeaponToPed(ped, 0xC0A3098D, 900, false) --give special carbine rifle
		--	--GiveWeaponToPed(ped, 0x05FC3C11, 300, false) --give sniper
		--	GiveWeaponToPed(ped, 0x0C472FE2, 900, false) --give heavy sniper rifle
		--	GiveWeaponToPed(ped, 0x440E4788, 1, false) --give golf club
		--	GiveWeaponToPed(ped, 0xE284C527, 300, false) --give assault shotgun
		--	GiveWeaponToPed(ped, 0x6D544C99, 50, false) --give railgun
		--	GiveWeaponToPed(ped, 0x2C3731D9, 50, false) --give c4
		--	
		--	
		--	GiveWeaponComponentToPed(ped, 0x1B06D571, 0x65EA7EBB) --give pistol accessories
		--	GiveWeaponComponentToPed(ped, 0x1B06D571, 0xD7391086) --give pistol accessories
		--	GiveWeaponComponentToPed(ped, 0x22D8FE39, 0x359B7AAE) --give AP torch
		--	
		--	GiveWeaponComponentToPed(ped, 0x13532244, 0x10E6BA2B) --give micro SMG accessories
		--	GiveWeaponComponentToPed(ped, 0x13532244, 0xA73D4664) --give micro SMG accessories
		--	GiveWeaponComponentToPed(ped, 0x13532244, 0x9D2FBF29) --give micro SMG accessories
		--			
		--	GiveWeaponComponentToPed(ped, 0x7FD62962, 0xD6C59CD6) --give mg box
		--	GiveWeaponComponentToPed(ped, 0x7FD62962, 0xA0D89C42) --give mg scope
		--	GiveWeaponComponentToPed(ped, 0x7FD62962, 0xC164F53) --give mg grip	
		--	
		--	--GiveWeaponComponentToPed(ped, 0xC0A3098D, 0x6B59AEAA) --give rifle accessories
		--	GiveWeaponComponentToPed(ped, 0xBFEFFF6D, 0xB1214F9B) --give rifle accessories
		--	GiveWeaponComponentToPed(ped, 0xC0A3098D, 0xA73D4664) --give rifle accessories
		--	GiveWeaponComponentToPed(ped, 0xC0A3098D, 0x7BC4CDDC) --give rifle accessories
		--	GiveWeaponComponentToPed(ped, 0xC0A3098D, 0xC164F53)  --give rifle accessories
		--	GiveWeaponComponentToPed(ped, 0xC0A3098D, 0xA0D89C42) --give rifle accessories
	    --
		--	GiveWeaponComponentToPed(ped, 0x0C472FE2, 0xBC54DA77) --give sniper scope
		--	
		--	GiveWeaponComponentToPed(ped, 0xE284C527, 0x86BD7F72) --give shotgun drum
		--	
		--	SetPedWeaponTintIndex(ped, 0x6D544C99, 6) -- orange railgun			
		--end		
		--
		--if (pos.id == 2) then -- Andrew
		--			--defaults
		--	GiveWeaponToPed(ped, 0x497FACC3, 300, false) --give flares
		--	
		--	GiveWeaponToPed(ped, 0xC1B3C3D1, 300, false) --give revolver
		--	GiveWeaponToPed(ped, 0x22D8FE39, 300, false) --give AP pistol
		--	GiveWeaponToPed(ped, 0x13532244, 900, false) --give micro SMG
		--	GiveWeaponToPed(ped, 0x61012683, 900, false) --give sweeper
		--	GiveWeaponToPed(ped, 0x83BF0278, 900, false) --give basic assault rifle
		--	---GiveWeaponToPed(ped, 0x7F229F94, 900, false) --give bullpup rifle
		--	GiveWeaponToPed(ped, 0xC734385A, 900, false) --give sniper rifle
		--	GiveWeaponToPed(ped, 0x958A4A8F, 1, false) --give bat
		--	GiveWeaponToPed(ped, 0x1D073A89, 300, false) --give shotgun
		--	GiveWeaponToPed(ped, 0xA284510B, 50, false) --give grenade launcher
		--	GiveWeaponToPed(ped, 0x24B17070, 50, false) --give molotov
		--	
		--	GiveWeaponComponentToPed(ped, 0x22D8FE39, 0x359B7AAE) --give AP torch
		--	
		--	GiveWeaponComponentToPed(ped, 0x13532244, 0x10E6BA2B) --give micro SMG accessories
		--	-- GiveWeaponComponentToPed(ped, 0x13532244, 0xA73D4664) --give micro SMG suppressor
		--	
		--	GiveWeaponComponentToPed(ped, 0x61012683, 0xEAC8C270) --give sweeper extended clip
		--	
		--	GiveWeaponComponentToPed(ped, 0x83BF0278, 0x837445AA) --give rifle accessories
		--	GiveWeaponComponentToPed(ped, 0x83BF0278, 0xC164F53)  --give rifle accessories
		--	GiveWeaponComponentToPed(ped, 0x83BF0278, 0xA0D89C42) --give rifle accessories
		--	GiveWeaponComponentToPed(ped, 0x83BF0278, 0xD89B9658) --give rifle accessories
		--	
		----	GiveWeaponComponentToPed(ped, 0x7F229F94, 0xB3688B0F) --give rifle accessories
		----	GiveWeaponComponentToPed(ped, 0x7F229F94, 0x837445AA) --give rifle accessories
		----	GiveWeaponComponentToPed(ped, 0x7F229F94, 0x7BC4CDDC) --give rifle accessories
		----	GiveWeaponComponentToPed(ped, 0x7F229F94, 0xC164F53)  --give rifle accessories
		----	GiveWeaponComponentToPed(ped, 0x7F229F94, 0xAA2C45B4) --give rifle accessories
		--	
		--	GiveWeaponComponentToPed(ped, 0xC734385A, 0xCCFD2AC5) --give sniper accessories
		--	GiveWeaponComponentToPed(ped, 0xC734385A, 0x7BC4CDDC) --give sniper accessories
		--	GiveWeaponComponentToPed(ped, 0xC734385A, 0xC164F53) --give sniper accessories
		--	--GiveWeaponComponentToPed(ped, 0x05FC3C11, 0xBC54DA77) --give sniper scope			
		--end
		--
		--if (pos.id == 4) then-- Zero
		--	--defaults
		--	GiveWeaponToPed(ped, 0x497FACC3, 300, false) --give flares
		--	
		--	GiveWeaponToPed(ped, 0x83BF0278, 600, false) --give rifle
		--	GiveWeaponToPed(ped, 0x13532244, 900, false) --give micro SMG
		--	GiveWeaponToPed(ped, 0x7FD62962, 800, false) --give mg
		--	GiveWeaponToPed(ped, 0x05FC3C11, 300, false) --give sniper
		--	GiveWeaponToPed(ped, 0x1B06D571, 300, false) --give pistol
		--	GiveWeaponToPed(ped, 0x22D8FE39, 300, false) --give AP pistol
		--	GiveWeaponToPed(ped, 0x63AB0442, 300, false) --give missile
		--	GiveWeaponToPed(ped, 0x9D61E50F, 300, false) --give shotgun
		--	GiveWeaponToPed(ped, 0x2C3731D9, 25, false) --give C4
		--	
		--	--GiveWeaponComponentToPed(ped, 0x83BF0278, 0x91109691) --give rifle extended clip
		--	GiveWeaponComponentToPed(ped, 0x83BF0278, 0x7BC4CDDC) --give rifle torch
		--	GiveWeaponComponentToPed(ped, 0x9D61E50F, 0x7BC4CDDC) --give shotgun torch
		--	GiveWeaponComponentToPed(ped, 0x13532244, 0x10E6BA2B) --give micro SMG accessories
		--	--GiveWeaponComponentToPed(ped, 0x13532244, 0xA73D4664) --give micro SMG accessories			
		--	GiveWeaponComponentToPed(ped, 0x7FD62962, 0xD6C59CD6) --give mg box
		--	GiveWeaponComponentToPed(ped, 0x7FD62962, 0xA0D89C42) --give mg scope
		--	GiveWeaponComponentToPed(ped, 0x7FD62962, 0xC164F53) --give mg grip
		--	--GiveWeaponComponentToPed(ped, 0x05FC3C11, 0xBC54DA77) --give sniper scope
		--	GiveWeaponComponentToPed(ped, 0x22D8FE39, 0x359B7AAE) --give AP torch
		--end
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