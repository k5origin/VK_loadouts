gui_loadouts = {
	opened = false,
	title = "",
	currentmenu = "main",
	lastmenu = nil,
	currentpos = nil,
	selectedbutton = 0,
	marker = { r = 0, g = 155, b = 255, a = 200, type = 1 }, -- ???
	menu = {
		x = 0.11,
		y = 0.25,
		width = 0.2,
		height = 0.04,
		buttons = 10,
		from = 1,
		to = 10,
		scale = 0.4,
		font = 0,
		["main"] = {
			title = "CHOOSE A LOADOUT",
			name = "main",
			buttons = {
			}
		},
	}
}

-------------------------------------------------
----------------CONFIG SELECTION----------------
-------------------------------------------------
function gui_loadouts_ButtonSelected(button)
	PlaySound(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
	local ped = GetPlayerPed(-1)
	local this = gui_loadouts.currentmenu
	local btn = button.name
	if this == "main" then
		loadout(button)
	end
end

-------------------------------------------------
----------------CONFIG OPEN MENU-----------------
-------------------------------------------------
function gui_loadouts_OpenSubMenu(menu)
	gui_loadouts.menu.from = 1
	gui_loadouts.menu.to = 10
	gui_loadouts.selectedbutton = 0
	gui_loadouts.currentmenu = menu
end
-------------------------------------------------
------------------DRAW TITLE MENU----------------
-------------------------------------------------
function gui_loadouts_drawMenuTitle(txt,x,y)
    local menu = gui_loadouts.menu
	SetTextFont(2)
	SetTextProportional(0)
	SetTextScale(0.5, 0.5)
	SetTextColour(255, 255, 255, 255)
	SetTextEntry("STRING")
	AddTextComponentString(txt)
	DrawRect(x,y,menu.width,menu.height,0,0,0,255)
	DrawText(x - menu.width/2 + 0.005, y - menu.height/2 + 0.0028)
end
-------------------------------------------------
------------------DRAW MENU BOUTON---------------
-------------------------------------------------
function gui_loadouts_drawMenuButton(button,x,y,selected)
	local menu = gui_loadouts.menu
	SetTextFont(menu.font)
	SetTextProportional(0)
	SetTextScale(menu.scale, menu.scale)
	if selected then
		SetTextColour(0, 0, 0, 255)
	else
		SetTextColour(255, 255, 255, 255)
	end
	SetTextCentre(0)
	SetTextEntry("STRING")
	AddTextComponentString(button.name)
	if selected then
		DrawRect(x,y,menu.width,menu.height,255,255,255,255)
	else
		DrawRect(x,y,menu.width,menu.height,0,0,0,150)
	end
	DrawText(x - menu.width/2 + 0.005, y - menu.height/2 + 0.0028)
end
-------------------------------------------------
------------------DRAW MENU INFO-----------------
-------------------------------------------------
function gui_loadouts_drawMenuInfo(text)
	local menu = gui_loadouts.menu
	SetTextFont(menu.font)
	SetTextProportional(0)
	SetTextScale(0.45, 0.45)
	SetTextColour(255, 255, 255, 255)
	SetTextCentre(0)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawRect(0.675, 0.95,0.65,0.050,255,255,255,150)
	DrawText(0.365, 0.934)
end
-------------------------------------------------
----------------DRAW MENU DROIT------------------
-------------------------------------------------
function gui_loadouts_drawMenuRight(txt,x,y,selected)
	local menu = gui_computer.menu
	SetTextFont(menu.font)
	SetTextProportional(0)
	SetTextScale(menu.scale, menu.scale)
	--SetTextRightJustify(1)
	if selected then
		SetTextColour(0, 0, 0, 255)
	else
		SetTextColour(255, 255, 255, 255)
	end
	SetTextCentre(1)
	SetTextEntry("STRING")
	AddTextComponentString(txt)
    DrawRect(0.01 + (menu.width)+((menu.width/3)/2),y,menu.width/3,menu.height,255,255,255,150)
	DrawText(0.01 + (menu.width)+((menu.width/3)/2), y - menu.height/2 + 0.0028)
end
-------------------------------------------------
-------------------DRAW TEXT---------------------
-------------------------------------------------
function gui_loadouts_drawTxt(text,font,centre,x,y,scale,r,g,b,a)
	SetTextFont(font)
	SetTextProportional(0)
	SetTextScale(scale, scale)
	SetTextColour(r, g, b, a)
	SetTextDropShadow(0, 0, 0, 0,255)
	SetTextDropShadow()
	SetTextOutline()
	SetTextCentre(centre)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x , y)
end
-------------------------------------------------
----------------CONFIG BACK MENU-----------------
-------------------------------------------------
function gui_loadouts_BackMenu()
	if gui_loadouts.currentmenu == "main" then
		gui_loadouts_CloseMenu()
		PlaySound(-1, "QUIT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
    end 
end
-------------------------------------------------
----------------FONCTION OPEN--------------------
-------------------------------------------------
function gui_loadouts_OpenMenu()
	gui_loadouts.currentmenu = "main"
	gui_loadouts.opened = true
	gui_loadouts.selectedbutton = 0
end
-------------------------------------------------
----------------FONCTION CLOSE-------------------
-------------------------------------------------
function gui_loadouts_CloseMenu()
    gui_loadouts.opened = false
    gui_loadouts.menu.from = 1
    gui_loadouts.menu.to = 10
end
-------------------------------------------------
----------------FONCTION OPEN MENU---------------
-------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

        local ped = GetPlayerPed(-1)
        local playerPos = GetEntityCoords(ped, true)
        local vehicle = GetVehiclePedIsIn(ped, false)

        if (Vdist(playerPos.x, playerPos.y, playerPos.z, WEAPONSHOPS[POS_actual].x, WEAPONSHOPS[POS_actual].y, WEAPONSHOPS[POS_actual].z) > 2.0) then
			if gui_loadouts.opened then
				gui_loadouts_CloseMenu()
			end
		end

		if gui_loadouts.opened then
            local ped = localPed()
            local menu = gui_loadouts.menu[gui_loadouts.currentmenu]
            gui_loadouts_drawTxt(gui_loadouts.title,1,1,gui_loadouts.menu.x,gui_loadouts.menu.y,1.0, 255,255,255,255)
            gui_loadouts_drawMenuTitle(menu.title, gui_loadouts.menu.x,gui_loadouts.menu.y + 0.08)
            gui_loadouts_drawTxt(gui_loadouts.selectedbutton.."/"..tablelength(menu.buttons),0,0,gui_loadouts.menu.x + gui_loadouts.menu.width/2 - 0.0385,gui_loadouts.menu.y + 0.067,0.4, 255,255,255,255)
            local y = gui_loadouts.menu.y + 0.12

			menu.buttons = {}
			for i,dest in pairs(WEAPONSHOPS[POS_actual].destination) do
				table.insert(menu.buttons , LOADOUTS[dest])
			end

            buttoncount = tablelength(menu.buttons)
            local selected = false

            for i,button in pairs(menu.buttons) do
                if i >= gui_loadouts.menu.from and i <= gui_loadouts.menu.to then
					if i == gui_loadouts.selectedbutton then
						selected = true
					else
						selected = false
					end
					gui_loadouts_drawMenuButton(button,gui_loadouts.menu.x,y,selected)
					if button.type ~= nil then
						gui_loadouts_drawMenuRight(button.type,gui_loadouts.menu.x,y,selected)
					end
					y = y + 0.04
					if selected and IsControlJustPressed(1,201) then
						gui_loadouts_ButtonSelected(button)
					end
                end
            end
		end

		if gui_loadouts.opened then
			if IsControlJustPressed(1,177) then
				gui_loadouts_BackMenu()
			end
			if IsControlJustPressed(1,188) then
				if gui_loadouts.selectedbutton > 1 then
					gui_loadouts.selectedbutton = gui_loadouts.selectedbutton -1
					PlaySound(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
					if buttoncount > 10 and gui_loadouts.selectedbutton < gui_loadouts.menu.from then
						gui_loadouts.menu.from = gui_loadouts.menu.from -1
						gui_loadouts.menu.to = gui_loadouts.menu.to - 1
					end
				end
			end
			if IsControlJustPressed(1,187)then
				if gui_loadouts.selectedbutton < buttoncount then
					gui_loadouts.selectedbutton = gui_loadouts.selectedbutton +1
					PlaySound(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
					if buttoncount > 10 and gui_loadouts.selectedbutton > gui_loadouts.menu.to then
						gui_loadouts.menu.to = gui_loadouts.menu.to + 1
						gui_loadouts.menu.from = gui_loadouts.menu.from + 1
					end
				end
			end
		end

	end
end)

function localPed()
	return GetPlayerPed(-1)
end

function tablelength(T)
	local count = 0
	for _ in pairs(T) do count = count + 1 end
	return count
end

