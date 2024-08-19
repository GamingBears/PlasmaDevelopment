local Players   = game:GetService("Players")
local Client    = Players.LocalPlayer
local Character = Client.Character
local Camera    = workspace.CurrentCamera
local HttpService = game:GetService("HttpService")

local Scripts1   = game:HttpGet('https://hennessy-net.vercel.app/temp.json')
local Scripts = HttpService:JSONDecode(Scripts1)

local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local Window = Fluent:CreateWindow({
    Title = "Plasma Hub",
    SubTitle = "",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = false, 
    Theme = "Darker",
    MinimizeKey = Enum.KeyCode.RightControl 
})

local function fireDialog(a)
    Window:Dialog({
        Title = "PlasmaV2",
        Content = "Executed " .. a,
        Buttons = {
            { 
                Title = "Ok",
                Callback = function()
                end 
            }
        }
    })
end

local Tabs = {
    Main = Window:AddTab({ Title = "Main", Icon = "menu" }),
    LocalPlayer = Window:AddTab({ Title = "Local Player", Icon = "user-cog" }),
    UniScripts = Window:AddTab({ Title = "Universal Scripts", Icon = "globe" }),
    ScriptHub = Window:AddTab({ Title = "Script Hub", Icon = "library" }),
    ESPs = Window:AddTab({ Title = "ESPs", Icon = "eye" }),
    ScrInfo = Window:AddTab({ Title = "Script Info", Icon = "info" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
}

local Universal = Tabs.UniScripts:AddSection("Universal")
for i,v in Scripts.Universal do
    Universal:AddButton({
        Title = i,
        Description = v.Description,
        Callback = function()
            if v.URL ~= nil and game:HttpGet(v.URL) ~= nil then
                loadstring(game:HttpGet(v.URL))()
                fireDialog(i)
            end
        end
    })
end

local ScriptHubs = Tabs.ScriptHub:AddSection("Script Hubs")
for i,v in Scripts.Hubs do
    ScriptHubs:AddButton({
        Title = i,
        Description = v.Description,
        Callback = function()
            if v.URL ~= nil and game:HttpGet(v.URL) ~= nil then
                loadstring(game:HttpGet(v.URL))()
                fireDialog(i)
            end
        end
    })
end

local ESps = Tabs.ESPs:AddSection("ESPs")
for i,v in Scripts.ESPs do
    ESps:AddButton({
        Title = i,
        Description = v.Description,
        Callback = function()
            if v.URL ~= nil and game:HttpGet(v.URL) ~= nil then
                loadstring(game:HttpGet(v.URL))()
                fireDialog(i)
            end
        end
    })
end
