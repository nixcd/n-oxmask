ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterUsableItem('trajebuceo', function(source, name)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('nix_o2mask:trajebuceo', source)
	if (true) then
		xPlayer.removeInventoryItem('trajebuceo', 1)
		print(xPlayer.getName() .. ' se ha puesto un 1 traje de buceo!') -- Print for Steam Name
	end
end)
