ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('n-oxmask:trajebuceo')
AddEventHandler('n-oxmask:trajebuceo', function()
	local playerPed = PlayerPedId()
	local coords = GetEntityCoords(playerPed)
	local boneIndex = GetPedBoneIndex(playerPed, 12844)
	local boneIndex2 = GetPedBoneIndex(playerPed, 24818)
	local totaltime = (Config.Time*1000) / 4

	-- ANIM DICTS
	RequestAnimDict('clothingtie')
	while not HasAnimDictLoaded('clothingtie') do
		Citizen.Wait(1)
	end

	RequestAnimDict('missmic4')
	while not HasAnimDictLoaded('missmic4') do
		Citizen.Wait(1)
	end
	-- ANIM DICTS

	FreezeEntityPosition(playerPed, true)
	ESX.ShowNotification(_U('putting'))
	TaskPlayAnim(playerPed, "missmic4", "michael_tux_fidget", 1.0, -1.0, 2000, 0, 1, true, true, true)
	Citizen.Wait(5000)
	TaskPlayAnim(playerPed, "clothingtie", "try_tie_positive_a", 1.0, -1.0, 2000, 0, 1, true, true, true)
	FreezeEntityPosition(playerPed, false)
	Citizen.Wait(1000)
	ESX.Game.SpawnObject('p_s_scuba_mask_s', {
		x = coords.x,
		y = coords.y,
		z = coords.z - 3
	}, function(object)
		ESX.Game.SpawnObject('p_s_scuba_tank_s', {
			x = coords.x,
			y = coords.y,
			z = coords.z - 3
		}, function(object2)
			AttachEntityToEntity(object2, playerPed, boneIndex2, -0.30, -0.22, 0.0, 0.0, 90.0, 180.0, true, true, false, true, 1, true)
			AttachEntityToEntity(object, playerPed, boneIndex, 0.0, 0.0, 0.0, 0.0, 90.0, 180.0, true, true, false, true, 1, true)
			SetPedDiesInWater(playerPed, false)
			ESX.ShowNotification(_U('correctly') .. '%.')

			Citizen.Wait(totaltime)
			ESX.ShowNotification(_U('oxlevel') .."~o~75%")

			Citizen.Wait(totaltime)
			ESX.ShowNotification(_U('oxlevel') .."~o~50%")

			Citizen.Wait(totaltime)
			ESX.ShowNotification(_U('oxlevel') .."~o~25%")

			Citizen.Wait(totaltime)
			ESX.ShowNotification(_U('oxlevel') .."~o~0%")

			SetPedDiesInWater(playerPed, true)
			DeleteObject(object)
			DeleteObject(object2)
			ClearPedSecondaryTask(playerPed)
		end)
	end)
end)
