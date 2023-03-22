local QBCore = exports['qb-core']:GetCoreObject()


local jewel1 = false
local store1 = false
local armortruck1 = false
local pacific1 = false
local home1 = false
local paleto1 = false
local fleeca1 = false


RegisterNetEvent('Polar-Wade:server:buyshit', function(ped)
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


function unarmoredtruck()

    armortruck1 = false

end
function unjewellery()

    jewel1 = false

end
function unstorerobbery()

    store1 = false

end exports('unstorerobbery', unstorerobbery)
function unhouserobbery()

    home1 = false

end exports('unhouserobbery', unhouserobbery)
function unfleecarobbery()

    fleeca1 = false

end exports('unfleecarobbery', unfleecarobbery)
function unpaletorobbery()

    paleto1 = false

end exports('unpaletorobbery', unpaletorobbery)
function unpacificrobbery()

    pacific1 = false

end exports('unpacificrobbery', unpacificrobbery)


function armoredtruck()

    armortruck1 = true

end exports('armoredtruck', armoredtruck)
function jewellery()

    jewel1 = true

end exports('jewellery', jewellery)
function storerobbery()

    store1 = true

end exports('storerobbery', storerobbery)
function houserobbery()

    home1 = true

end exports('houserobbery', houserobbery)
function fleecarobbery()

    fleeca1 = true

end exports('fleecarobbery', fleecarobbery)
function paletorobbery()

    paleto1 = true

end exports('paletorobbery', paletorobbery)
function pacificrobbery()

    pacific1 = true

end exports('pacificrobbery', pacificrobbery)

QBCore.Functions.CreateCallback("Polar-Wade:Server:House", function(source, cb)
    cb(home1)
end)

QBCore.Functions.CreateCallback("Polar-Wade:Server:Store", function(source, cb)
    cb(store1)
end)

QBCore.Functions.CreateCallback("Polar-Wade:Server:Jewel", function(source, cb)
    cb(jewel1)
end)

QBCore.Functions.CreateCallback("Polar-Wade:Server:armorstruck", function(source, cb)
    cb(armortruck1)
end)

QBCore.Functions.CreateCallback("Polar-Wade:Server:pacific", function(source, cb)
    cb(pacific1)
end)

QBCore.Functions.CreateCallback("Polar-Wade:Server:paleto", function(source, cb)
    cb(paleto1)
end)

QBCore.Functions.CreateCallback("Polar-Wade:Server:fleeca", function(source, cb)
    cb(fleeca1)
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