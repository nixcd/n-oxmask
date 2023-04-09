ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterUsableItem('trajebuceo', function(source, name)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('n-oxmask:trajebuceo', source)
	xPlayer.removeInventoryItem('trajebuceo', 1)
	print(xPlayer.getName() .. _U('consoleprint')) -- Log in main console.
end)
