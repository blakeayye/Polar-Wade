local QBCore = exports['qb-core']:GetCoreObject()
CreateThread(function()
    --traderpeds()
end)
AddEventHandler('onResourceStart', function(resource)
    if resource == GetCurrentResourceName() then
        Wait(100)
        peds()
    end
end)
RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    Wait(100)
    peds()
    
end)

local cops = 5
local pable = {}
local table = {}
local hable = {}
RegisterNetEvent('police:SetCopCount', function(amount) cops = amount end)

function tablecheck(name)
    local p = table[name]
    if p == true then 
        pable[name] = 'Not Available'
        hable[name] = true
    else
        pable[name] = 'Available'
        hable[name] = false
    end
end
function policecheck(name, amount)
    if cops >= amount then
        pable[name] = 'Available'
        hable[name] = false
    else
        pable[name] = 'Not Available'
        hable[name] = true
    end
end
RegisterNetEvent('Polar-Wade:Client:Banks', function()
    exports['qb-menu']:openMenu({
    {
            
        isMenuHeader = true,
        icon = "fa-solid fa-circle-info",
        header = "Available Banks",
            
    },
    {
        icon = "fa-solid fa-circle-info",
        header = "Fleeca Bank",
        disabled = hable["Fleeca"],
        text = pable["Fleeca"],
        isMenuHeader = true,
        
    },
    {
        icon = "fa-solid fa-circle-info",
        header = "Paleto Bank",
        disabled = hable["Paleto"],
        text = pable["Paleto"],
        isMenuHeader = true,
    },
    {
        icon = "fa-solid fa-circle-info",
        header = "Pacific Standard",
        disabled = hable["Pacific"],
        text = pable["Pacific"],
        isMenuHeader = true,
    },
    {
        header = "Go Back",
        icon = "fa-solid fa-angle-left",
        params = {
            event = "Polar-Wade:Client:MainMenu",
        }
    },
    })

end)
RegisterNetEvent('Polar-Wade:Client:AvailableRobberies', function()
    exports['qb-menu']:openMenu({

    {
        
        isMenuHeader = true,
        icon = "fa-solid fa-circle-info",
        header = "Available Robberies",
        
    },
    {
        icon = "fa-solid fa-circle-info",
        header = "Properties",
        disabled = hable["House"],
        text = pable["House"],
        isMenuHeader = true,
    },
    {
        icon = "fa-solid fa-circle-info",
        header = "Convenience Store",
        disabled = hable["Store"],
        text = pable["Store"],
        isMenuHeader = true,
    },
    {
        icon = "fa-solid fa-circle-info",
        header = "Vangelico Jewellery",
       disabled = hable["Jewelry"],
       text = pable["Jewelry"],
        isMenuHeader = true,
    },
    {
        icon = "fa-solid fa-circle-info",
        header = "Armored Trucks",
        disabled = hable["ArmoredTruck"],
        text = pable["ArmoredTruck"],
        isMenuHeader = true,
    },
    {
        header = "Go Back",
        icon = "fa-solid fa-angle-left",
        params = {
            event = "Polar-Wade:Client:MainMenu",
        }
    },
    })

end)

RegisterNetEvent('Polar-Wade:Client:OpenShop', function()
    local header = {
        {
            isMenuHeader = true,
            icon = "fa-solid fa-circle-info",
            header = "Welcome to my little shop"
        }
    }
    for k, v in pairs(Config.Shop) do
        if QBCore.Shared.Items[v.item].label then
            header[#header+1] = {
                header = QBCore.Shared.Items[v.item].label,
               disabled = "Price: "..v.price,
                icon = v.icon,
                params = {
                    isServer = true,
                    event = "Polar-Wade:Server:buyshit",
                    args = k
                }
            }
        end
    end
    header[#header+1] = {
        header = "Go Back",
        icon = "fa-solid fa-angle-left",
        params = {
            event = "Polar-Wade:Client:MainMenu",
        }
    }

    exports['qb-menu']:openMenu(header)
end)

RegisterNetEvent('Polar-Wade:Client:MainMenu', function()
    
    exports['qb-menu']:openMenu({
 
        {
            isMenuHeader = true,
            icon = "fa-solid fa-circle-info",
            header = "I heard you seek information"
        },
        {
            icon = "fa-solid fa-circle-info",
            header = "Available Robberies",
            params = {
                event = "Polar-Wade:Client:Types",
                args = {
                    numeral = 1
                }
            }
        },
        {
            icon = "fa-solid fa-circle-info",
            header = "Available Banks",
            params = {
                event = "Polar-Wade:Client:Types",
                args = {
                    numeral = 2
                }
            }
        },
        {
            icon = "fa-solid fa-circle-info",
            header = "View Shop",
            params = {
                event = "Polar-Wade:Client:OpenShop",
            }
        },
    })
 
end)

function peds()
for i = 1, #Config.Peds do
    exports['qb-target']:SpawnPed({
        model = Config.Peds[i].model,
        coords = Config.Peds[i].coords,
        minusOne = true,
        freeze = true,
        invincible = false,
        blockevents = true,
        scenario = 'WORLD_HUMAN_AA_COFFEE',
        target = {
            options = {
            {
                type = "client",
                icon = 'fa-solid fa-question',
                label = 'Talk to Wade',
                event = 'Polar-Wade:Client:MainMenu',
             
            }
            },
            distance = 2.5,
        },
    })
end
end


RegisterNetEvent('Polar-Wade:Client:Types', function(data)
    local number = data.numeral

        QBCore.Functions.TriggerCallback('Polar-Wade:Server:Table', function(tables)
            table = tables
        
        
        end)

        Wait(100)

        tablecheck("House")
        policecheck("House", 1)

        tablecheck("Store")
        policecheck("Store", 2)
       
        tablecheck("Jewelry")
        policecheck("Jewelry", 3)
        
        tablecheck("ArmoredTruck")
        policecheck("ArmoredTruck", 4)
        
        tablecheck("Pacific")
        policecheck("Pacific", 4)
        
        tablecheck("Fleeca")
        policecheck("Fleeca", 4)
        
        tablecheck("Paleto")
        policecheck("Paleto", 3)

        Wait(25)

    if number == 1 then

        TriggerEvent('Polar-Wade:Client:AvailableRobberies')

    elseif number == 2 then

        TriggerEvent('Polar-Wade:Client:Banks')
    
    end
end)
    



