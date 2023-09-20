local QBCore = exports['qb-core']:GetCoreObject()


local Jewelry = false
local Stores = true
local ArmoredTruck = false
local Pacific = false
local House = false
local Paleto = false
local Fleeca = false

RegisterNetEvent('Polar-Wade:Server:buyshit', function(ped)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not src or not Player or not ped then return end
    -- local cash = Player.PlayerData.money[Config.Shop[ped].type]
    local price = Config.Shop[ped].price
    local payType = Config.Shop[ped].type

    if Player.Functions.RemoveMoney(payType, price) ~= true then
        TriggerClientEvent('QBCore:Notify', src, 'Not enough ' .. payType, 'error')
        return
    end

    if Player.Functions.AddItem(Config.Shop[ped].item, 1) ~= true then
        Player.Functions.AddMoney(payType, price)
        TriggerClientEvent('QBCore:Notify', src, 'Could not give item', 'error')
        return
    end

    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.Shop[ped].item], "add")
    TriggerClientEvent('QBCore:Notify', src, "Here's the contraband, Good Luck!")
end)

local table = {}

exports('Paleto', function(rob) if rob then Paleto = false else Paleto = true end end)
exports('Pacific', function(rob) if rob then Pacific = false else Pacific = true end end)
exports('Stores', function(rob) if rob then Stores = false else Stores = true end end)
exports('Jewelry', function(rob) if rob then Jewelry = false else Jewelry = true end end)
exports('ArmoredTruck', function(rob) if rob then ArmoredTruck = false else ArmoredTruck = true end end)
exports('Fleeca', function(rob) if rob then Fleeca = false else Fleeca = true end end)
exports('House', function(rob) if rob then House = false else House = true end end)


QBCore.Functions.CreateCallback("Polar-Wade:Server:Table", function(source, cb) 
    table["House"] = House
    table["Stores"] = Stores
    table["Jewelry"] = Jewelry
    table["ArmoredTruck"] = ArmoredTruck
    table["Pacific"] = Fleeca
    table["Fleeca"] = Paleto
    table["Paleto"] = Paleto
    cb(table) 
end)


QBCore.Functions.CreateCallback('Polar-Wade:Server:cops', function(source, cb)
    local amount = 0
    local players = QBCore.Functions.GetQBPlayers()
    for k, v in pairs(players) do
        if (v.PlayerData.job.name == "police" or v.PlayerData.job.name == "bcso") and v.PlayerData.job.onduty then
            amount = amount + 1
        end
    end
    cb(amount)
end)








