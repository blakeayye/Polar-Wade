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

local cops = 0
local store = true
local jewel = false
local armoredtruck = false
local home = false
local fleeca = true
local paleto = true
local pacific = false



RegisterNetEvent('Polar-Wade:client:Banks', function()
    
   
   
    
   
    exports['qb-menu']:openMenu({
    {
            
        isMenuHeader = true,
        icon = "fa-solid fa-circle-info",
        header = "Available Banks",
            
    },
    {
        icon = "fa-solid fa-circle-info",
        header = "Fleeca Bank",
        disabled = fleecatype,
        text = fleecatext,
        isMenuHeader = true,
        
    },
    {
        icon = "fa-solid fa-circle-info",
        header = "Paleto Bank",
        disabled = paletotype,
        text = paletotext,
        isMenuHeader = true,
    },
    {
        icon = "fa-solid fa-circle-info",
        header = "Pacific Standard",
        disabled = pacifictype,
        text = pacifictext,
        isMenuHeader = true,
    },
    {
        header = "Go Back",
        icon = "fa-solid fa-angle-left",
        params = {
            event = "Polar-Wade:client:MainMenu",
        }
    },
    })

end)
RegisterNetEvent('Polar-Wade:client:AvailableRobberies', function()
   
   
  
    exports['qb-menu']:openMenu({

    {
        
        isMenuHeader = true,
        icon = "fa-solid fa-circle-info",
        header = "Available Robberies",
        
    },
    {
        icon = "fa-solid fa-circle-info",
        header = "Properties",
        disabled = hometype,
        text = hometext,
        isMenuHeader = true,
    },
    {
        icon = "fa-solid fa-circle-info",
        header = "Convenience Store",
        disabled = storetype,
        text = storetext,
        isMenuHeader = true,
    },
    {
        icon = "fa-solid fa-circle-info",
        header = "Vangelico Jewellery",
       disabled = jeweltype,
       text = jeweltext,
        isMenuHeader = true,
    },
    {
        icon = "fa-solid fa-circle-info",
        header = "Armored Trucks",
        disabled = trucktype,
        text = trucktext,
        isMenuHeader = true,
    },
    {
        header = "Go Back",
        icon = "fa-solid fa-angle-left",
        params = {
            event = "Polar-Wade:client:MainMenu",
        }
    },
    })

end)

RegisterNetEvent('Polar-Wade:client:OpenShop', function()
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
                    event = "Polar-Wade:server:buyshit",
                    args = k
                }
            }
        end
    end
    header[#header+1] = {
        header = "Go Back",
        icon = "fa-solid fa-angle-left",
        params = {
            event = "Polar-Wade:client:MainMenu",
        }
    }

    exports['qb-menu']:openMenu(header)
end)

RegisterNetEvent('Polar-Wade:client:MainMenu', function()
    
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
                event = "Polar-Wade:client:OpenShop",
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
                event = 'Polar-Wade:client:MainMenu',
             
            }
            },
            distance = 2.5,
        },
    })
end
end


RegisterNetEvent('Polar-Wade:Client:Types', function(data)
    number = data.numeral
    QBCore.Functions.TriggerCallback('Polar-Wade:Server:pacific', function(pacific1)
        pacific = pacific1
        end)
       Wait(25)
        QBCore.Functions.TriggerCallback('Polar-Wade:Server:paleto', function(paleto1)
            paleto = paleto1
            end)
            Wait(25)
            QBCore.Functions.TriggerCallback('Polar-Wade:Server:fleeca', function(fleeca1)
                fleeca = fleeca1
                end)
                Wait(25)
    QBCore.Functions.TriggerCallback('Polar-Wade:Server:Store', function(store1)
        store = store1
        print(store)
        end)
        Wait(25)
        QBCore.Functions.TriggerCallback('Polar-Wade:Server:House', function(home1)
            home = home1
            --print(home)
            end)
            Wait(25)
        QBCore.Functions.TriggerCallback('Polar-Wade:Server:Jewel', function(jewel1)
            jewel = jewel1
            --print(jewel)
            end)
            Wait(25)
            QBCore.Functions.TriggerCallback('Polar-Wade:Server:armorstruck', function(armortruck1)
                armoredtruck = armortruck1
               -- print(armoredtruck)
                end)
                Wait(25)
    QBCore.Functions.TriggerCallback('Polar-Wade:Server:cops', function(amount)
        cops = amount
        
       
       -- cops = 1
        print(cops)
    if cops == 0 then

        hometype = true
        hometext = 'Not Available'
        storetype = true
        storetext = 'Not Available'
        jeweltype = true
        jeweltext = 'Not Available'
        trucktype = true
        trucktext = 'Not Available'
        paletotype = true
        paletotext = 'Not Available'
        pacifictype = true
        pacifictext = 'Not Available'
        fleecatype = true
        fleecatext = 'Not Available'

        if number == 1 then
            TriggerEvent('Polar-Wade:client:AvailableRobberies')
        elseif number == 2 then
            TriggerEvent('Polar-Wade:client:Banks')
    
        end
    elseif cops == 1 then
        
        storetype = true
        storetext = 'Not Available'
        jeweltype = true
        jeweltext = 'Not Available'
        trucktype = true
        trucktext = 'Not Available'
        paletotype = true
        paletotext = 'Not Available'
        pacifictype = true
        pacifictext = 'Not Available'
        fleecatype = true
        fleecatext = 'Not Available'

        if home == false then
            hometype = false
            hometext = 'Available'
        else
            hometype = true
            hometext = 'Not Available'
        end
       
        if number == 1 then
            TriggerEvent('Polar-Wade:client:AvailableRobberies')
        elseif number == 2 then
            TriggerEvent('Polar-Wade:client:Banks')
    
        end
    elseif cops == 2 then
       
        jeweltype = true
        jeweltext = 'Not Available'
        trucktype = true
        trucktext = 'Not Available'
        paletotype = true
        paletotext = 'Not Available'
        pacifictype = true
        pacifictext = 'Not Available'
        fleecatype = true
        fleecatext = 'Not Available'

        if home == false then
            hometype = false
            hometext = 'Available'
        else
            hometype = true
            hometext = 'Not Available'
        end
        
        if store == false then
            storetype = false
            storetext = 'Available'
        else
            storetype = true
            storetext = 'Not Available'
        end
        if number == 1 then
            TriggerEvent('Polar-Wade:client:AvailableRobberies')
        elseif number == 2 then
            TriggerEvent('Polar-Wade:client:Banks')
    
        end

    elseif cops == 3 then

        paletotype = true
        paletotext = 'Not Available'
        pacifictype = true
        pacifictext = 'Not Available'
        fleecatype = true
        fleecatext = 'Not Available'

        if jewel == false then
            jeweltype = false
            jeweltext = 'Available'
        else
            jeweltype = true
            jeweltext = 'Not Available'
        end

        if home == false then
            hometype = false
            hometext = 'Available'
        else
            hometype = true
            hometext = 'Not Available'
        end

        if store == false then
            storetype = false
            storetext = 'Available'
        else
            storetype = true
            storetext = 'Not Available'
        end

        if armoredtruck == false then
            trucktype = false
            trucktext = 'Available'
        else
            trucktype = true
            trucktext = 'Not Available'
        end
        if number == 1 then
            TriggerEvent('Polar-Wade:client:AvailableRobberies')
        elseif number == 2 then
            TriggerEvent('Polar-Wade:client:Banks')
    
        end
    elseif cops >= 4 then

        if jewel == false then
            jeweltype = false
            jeweltext = 'Available'
        else
            jeweltype = true
            jeweltext = 'Not Available'
        end

        if home == false then
            hometype = false
            hometext = 'Available'
        else
            hometype = true
            hometext = 'Not Available'
        end

        if store == false then
            storetype = false
            storetext = 'Available'
        else
            storetype = true
            storetext = 'Not Available'
        end

        if armoredtruck == false then
            trucktype = false
            trucktext = 'Available'
        else
            trucktype = true
            trucktext = 'Not Available'
        end

        if fleeca == false then
            fleecatype = false
            fleecatext = 'Available'
        else
            fleecatype = true
            fleecatext = 'Not Available'
        end

        if paleto == false then
            paletotype = false
            paletotext = 'Available'
        else
            paletotype = true
            paletotext = 'Not Available'
            
        end

        if pacific == false then
            pacifictype = false
            pacifictext = 'Available'
        else
            pacifictype = true
            pacifictext = 'Not Available'
        end
        if number == 1 then
            TriggerEvent('Polar-Wade:client:AvailableRobberies')
        elseif number == 2 then
            TriggerEvent('Polar-Wade:client:Banks')
    
        end
    else

        print('none')
        
    end
    end)
    

end)
