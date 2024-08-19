local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local Window = Fluent:CreateWindow({
    Title = "Plasma Hub",
    SubTitle = "",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true, -- The blur may be detectable, setting this to false disables blur entirely
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.RightControl -- Used when theres no MinimizeKeybind
})

--Fluent provides Lucide Icons https://lucide.dev/icons/ for the tabs, icons are optional
local Tabs = {
    Main = Window:AddTab({ Title = "Main", Icon = "menu" }),
    LocalPlayer = Window:AddTab({ Title = "Local Player", Icon = "user-cog" }),
    UniScripts = Window:AddTab({ Title = "Universal Scripts", Icon = "globe" }),
    ScriptHub = Window:AddTab({ Title = "Script Hub", Icon = "library" }),
    ScrInfo = Window:AddTab({ Title = "Script Info", Icon = "info" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
}

local Options = Fluent.Options

do --START

-- MAIN




    Tabs.Main:AddParagraph({
        Title = "dsc.gg/plasmahub",
        Content = "Be sure to join our discord server to report broken scripts!! "
    })

    Tabs.Main:AddParagraph({
        Title = "Update log: Plasma V2 Update!",
        Content = "Added some more game scripts, Currently untested from bloxscripts "
    })

    local Keybind = Tabs.Main:AddKeybind("Keybind", {
    Title = "Destroy UI Press ]",
    Description = "Just in case you ever drag it off screen.",
    Mode = "Toggle", -- Always, Toggle, Hold
    Default = "RightBracket", -- String as the name of the keybind (MB1, MB2 for mouse buttons)

    -- Occurs when the keybind is clicked, Value is `true`/`false`
    Callback = function(Value)
        Fluent:Destroy()
    end,

    -- Occurs when the keybind itself is changed, `New` is a KeyCode Enum OR a UserInputType Enum
    ChangedCallback = function(New)
        print("Keybind changed!", New)
    end
})

    Tabs.Main:AddButton({
    Title = "UNC Test",
    Description = "Does a UNC test and prints executor level in output press (F9)",
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/unified-naming-convention/NamingStandard/main/UNCCheckEnv.lua'))()
	wait(6)
	print("Executor level:") printidentity()
    end
})

-- LOCAL PLAYER

    Tabs.LocalPlayer:AddButton({
    Title = "Default Settings",
    Description = "Returns to the normal default walk and jump speeds (16, 50)",
    Callback = function()
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
game.Players.LocalPlayer.Character.Humanoid.JumpPower = 50
        
    end
})

local Slider = Tabs.LocalPlayer:AddSlider("Slider", 
{
    Title = "Speed",
    Description = "Edit your users speed",
    Default = 16,
    Min = 1,
    Max = 300,
    Rounding = 0.75,
    Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = (Value)
    end
})

local Slider = Tabs.LocalPlayer:AddSlider("Slider", 
{
    Title = "Jump Power",
    Description = "Edit your users jump power",
    Default = 50,
    Min = 1,
    Max = 300,
    Rounding = 0.75,
    Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = (Value)
    end
})

local Input = Tabs.LocalPlayer:AddInput("Input", {
    Title = "Clock Time",
    Description = "Edits Client's clock time.",
    Default = "",
    Placeholder = "0-24",
    Numeric = true, -- Only allows numbers
    Finished = true, -- Only calls callback when you press enter
    Callback = function(Value)
        game.Lighting.ClockTime = (Value)
    end
})

local Input = Tabs.LocalPlayer:AddInput("Input", {
    Title = "Gravity",
    Description = "Edits Client's game gravity.",
    Default = "",
    Placeholder = "196.2 Default",
    Numeric = true, -- Only allows numbers
    Finished = true, -- Only calls callback when you press enter
    Callback = function(Value)
        workspace.Gravity = (Value)
    end
})



local Input = Tabs.LocalPlayer:AddInput("Input", {
    Title = "Field Of View/FOV",
    Description = "Edits Client's FOV.",
    Default = "70",
    Placeholder = "Default 70",
    Numeric = true, -- Only allows numbers
    Finished = true, -- Only calls callback when you press enter
    Callback = function(Value)
        workspace.Camera.FieldOfView = (Value)
    end
})

    Tabs.LocalPlayer:AddButton({
    Title = "Fullbright",
    Description = "Removes all shadows and brightens your game",
    Callback = function()
        loadstring(game:HttpGet('https://pastebin.com/raw/tePZ6ke3'))()
    end
})

    Tabs.LocalPlayer:AddButton({
    Title = "Rejoin",
    Description = "Leaves and rejoins the current game you are in",
    Callback = function()
        loadstring(game:HttpGet('https://pastebin.com/raw/PHAPvvxU'))()
    end
})

local Section = Tabs.LocalPlayer:AddSection("Other Universal Local Player Scripts")

    Tabs.LocalPlayer:AddButton({
    Title = "Infinite Jump",
    Description = "Press V to toggle",
    Callback = function()
        loadstring(game:HttpGet('https://pastebin.com/raw/vp25QVYP'))()
    end
})



    Tabs.LocalPlayer:AddButton({
    Title = "Click TP",
    Description = "Press Ctrl+LMB to use once pressed",
    Callback = function()
        loadstring(game:HttpGet('https://pastebin.com/raw/vdLumqAq'))()
    end
})

    Tabs.LocalPlayer:AddButton({
    Title = "Btools",
    Description = "Gives you client sided Building tools from old Roblox",
    Callback = function()
        loadstring(game:HttpGet('https://pastebin.com/raw/syqWRnHC'))()
    end
})

    Tabs.LocalPlayer:AddButton({
    Title = "Unlock Workspace",
    Description = "Any locked parts that Btools doesn't work on, becomes unlocked",
    Callback = function()
        loadstring(game:HttpGet('https://pastebin.com/raw/HeqXPvf4'))()
    end
})

    Tabs.LocalPlayer:AddButton({
    Title = "Anti AFK",
    Description = "Removes the kick after 20 minutes",
    Callback = function()
        loadstring(game:HttpGet('https://pastebin.com/raw/kjB4evnt'))()
    end
})

    Tabs.LocalPlayer:AddButton({
    Title = "Focus Anti AFK",
    Description = "Game thinks you are still on the Roblox app while you can do other things",
    Callback = function()
        loadstring(game:HttpGet('https://pastebin.com/raw/skQ1tvsL'))()
    end
})

    Tabs.LocalPlayer:AddButton({
    Title = "Enable Reset",
    Description = "Enables the reset button if disabled. On a loop",
    Callback = function()
        loadstring(game:HttpGet('https://pastebin.com/raw/LKMsu2yK'))()
    end
})


-- UNIVERSAL

    Tabs.UniScripts:AddButton({
    Title = "Infinite Yield",
    Description = "A universal admin script that works on every game",
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
    end
})

    Tabs.UniScripts:AddButton({
	Title = "Infinite Yield Rebord",
    Description = "Fan-made infinite yield",
    Callback = function()
         loadstring(game:HttpGet("https://github.com/fuckusfm/infiniteyield-reborn/raw/master/source"))()
    end
})

    Tabs.UniScripts:AddButton({
    Title = "Server finder",
    Description = "In game server browser",
    Callback = function()
       loadstring(game:HttpGet("https://www.scriptblox.com/raw/Server-Browser_80", true))();
    end
})

    Tabs.UniScripts:AddButton({
    Title = "Dex Explorer",
    Description = "Decompiler may not work",
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/infyiff/backup/main/dex.lua'))()
    end
})

    Tabs.UniScripts:AddButton({
    Title = "Simple Spy",
    Description = "No solara support",
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/exxtremestuffs/SimpleSpySource/master/SimpleSpy.lua'))()
    end
})

    Tabs.UniScripts:AddButton({
    Title = "Simple Chat Bypasser",
    Description = "Bypasses roblox chat filter",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/SkireScripts/Ouxie/main/Projects/simplebypassv3"))()
    end
})

    Tabs.UniScripts:AddButton({
    Title = "Ingame executor",
    Description = "An in-game executor that looks like a command prompt",
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/GamingBears/Scripts/main/InGameExecutor'))()
    end
})

    Tabs.UniScripts:AddButton({
    Title = "All emotes",
    Description = "With this script, you have access to every single R15 emote for free, which others can see!",
    Callback = function()
        loadstring(game:HttpGet('https://pastebin.com/raw/9dLpXWt1'))()
    end
})

    Tabs.UniScripts:AddButton({
    Title = "Unnamed ESP",
    Description = "An awesome universal esp script, tracers, boxes, health and more!",
    Callback = function()
        pcall(function() loadstring(game:HttpGet('https://raw.githubusercontent.com/ic3w0lf22/Unnamed-ESP/master/UnnamedESP.lua'))() end)
    end
})

    Tabs.UniScripts:AddButton({
    Title = "Universal Aimbot",
    Description = "NEW ONE",
    Callback = function()
	loadstring(game:HttpGet('https://gist.githubusercontent.com/pleaseful/340594344eb73891941d2d01af742618/raw/94063ac38cbda5f382675ca949db75f6cc683fd8/Aimmerz%2520V2.lua'))()
    end
})

local Section = Tabs.UniScripts:AddSection("Hubs")

    Tabs.UniScripts:AddButton({
    Title = "DomainX Hub",
    Description = "An admin/universal command bar which has all your basic needs",
    Callback = function()
        loadstring(game:HttpGet('https://pastebin.com/raw/YqD1TpgD'))()--
    end
})

    Tabs.UniScripts:AddButton({
    Title = "VG Hub",
    Description = "Supports 140+ Games",
    Callback = function()
        getgenv().KeySystem = false 

loadstring(game:HttpGet('https://raw.githubusercontent.com/1201for/V.G-Hub/main/V.Ghub'))()

    end
})

    Tabs.UniScripts:AddButton({
    Title = "Reaper Hub",
    Description = "A large script which supports many games || https://discord.gg/reaperhub",
    Callback = function()
	loadstring((http.request{Url="https://reaperscripts.com/loader?l=1"}).Body,"0zek8y2bld7.qowl6c7o~1")();
    end
})

    Tabs.UniScripts:AddButton({
	Title = "Owl Hub",
    Description = "Universal/Game ESP, aimbot, silent aim and more. May not be Solara supported",
    Callback = function()
         loadstring(game:HttpGet("https://raw.githubusercontent.com/CriShoux/OwlHub/master/OwlHub.txt"))()
    end
})

    Tabs.UniScripts:AddButton({
    Title = "Orca Hub",
    Description = "Similar to domain it has everything you need for exploiting",
    Callback = function()
         loadstring(game:HttpGet('https://raw.githubusercontent.com/richie0866/orca/master/public/latest.lua'))()
    end
})

    Tabs.UniScripts:AddButton({
    Title = "Equinox Hub",
    Description = "A very large FE script hub",
    Callback = function()
         loadstring(game:HttpGet('https://pastebin.com/raw/wzB1Qh78'))()
    end
})

    Tabs.UniScripts:AddButton({
    Title = "Venox Hub",
    Description = "A very large FE script hub",
    Callback = function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/venoxhh/venoxV1/main/main.lua'))()
    end
})

-- SCRIPT HUB

    Tabs.ScriptHub:AddButton({
    Title = "Decaying Winter",
    Description = "Key: Limbo Lust all gone.",
    Callback = function()
        loadstring(game:HttpGet(('https://raw.githubusercontent.com/sasquatchhtv/SasHub/main/DWScriptFree'),true))()
    end
})

    Tabs.ScriptHub:AddButton({
    Title = "Natural Disaster Survival",
    Description = "",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/tbao143/thaibao/main/TbaoHubNaturalDisasterSurvival"))()
    end
})

    Tabs.ScriptHub:AddButton({
    Title = "Hellmet ESP",
    Description = "This can also be used as a universal ESP. Can't be turned off",
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/Lucasfin000/SpaceHub/main/UESP'))()
    end
})

    Tabs.ScriptHub:AddButton({
    Title = "Naval Warfare",
    Description = "2 scripts",
    Callback = function()
        loadstring(game:HttpGet('https://pastebin.com/raw/CYWenD1T'))()
		loadstring(game:HttpGet('https://pastebin.com/raw/vr5DGzEX'))()
    end
})

    Tabs.ScriptHub:AddButton({
    Title = "Rivals",
    Description = "Rivals script, untested.",
    Callback = function()
        Key = ""
SynZ = false
loadstring(game:HttpGet("https://raw.githubusercontent.com/VaxKs/gfe/main/Rivalsss.lua"))()
    end
})

    Tabs.ScriptHub:AddButton({
    Title = "Arsenal",
    Description = "Emblem Hub",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/xYwLY6hj"))()
    end
})

    Tabs.ScriptHub:AddButton({
    Title = "Arsenal",
    Description = "Thunder client",
    Callback = function()
        if not game:IsLoaded() then
    game.Loaded:Wait()
end

local owner = 'andrewdarkyyofficial'
local branch = 'main'

loadstring(http.request({
    Url = string.format('https://raw.githubusercontent.com/%s/thunderclient/%s/main.lua', owner, branch),
    Method = 'GET'
}).Body)()
    end
})

    Tabs.ScriptHub:AddButton({
    Title = "MM2",
    Description = "Ather Hub",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Athergaming/Roblox-Murder-Mystery-2-Script/main/AtherHub%20Murder%20Mystery%202%20Script.lua"))()
    end
})

    Tabs.ScriptHub:AddButton({
    Title = "Da Hood",
    Description = "TBO",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/cool5013/TBO/main/TBOscript"))()
    end
})

    Tabs.ScriptHub:AddButton({
    Title = "Bedwars VapeV4",
    Description = "Not 100% Supported on Solara",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/main/NewMainScript.lua", true))()
    end
})

    Tabs.ScriptHub:AddButton({
	    Title = "Bedwars Aether Client",
    Description = "Solara supported",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/CakScripts/AetherClientBW/main/MainScript", true))()
    end
})

    Tabs.ScriptHub:AddButton({
    Title = "Jailbreak",
    Description = "SensationV2 [Luarmor] Join discord (dsc.gg/sensation) for updates and support",
    Callback = function()
    loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/730854e5b6499ee91deb1080e8e12ae3.lua"))()
end
})

    Tabs.ScriptHub:AddButton({
    Title = "Skywars [CLASSIC]",
    Description = "Skywars script",
    Callback = function()
        loadstring(game:HttpGet("https://paste.ee/r/r9gnA"))()
    end
})



    Tabs.ScriptHub:AddButton({
    Title = "Blade Ball Auto Parry",
    Description = "Nexam Hub [Luarmor] verified",
    Callback = function()
        loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/6af56c1753ac6679dee3acbd1fd952e5.lua"))()
    end
})

    Tabs.ScriptHub:AddButton({
    Title = "Blox Fruits",
    Description = "Bean Hub, Verified bloxscripts",
    Callback = function()
	loadstring(game:HttpGet(('https://raw.githubusercontent.com/SoyEIPekka/BeanHub/main/bloxfruitsnewpc2023'),true))()
    end
})


    Tabs.ScriptHub:AddButton({
    Title = "Break In 1",
    Description = "Press J for swat in lobby",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/JxA64gTB", true))()
    end
})

    Tabs.ScriptHub:AddButton({
    Title = "Sandhurst Military Academy",
    Description = "For trolling",
    Callback = function()
        loadstring(game:HttpGet(('https://raw.githubusercontent.com/ExamV1/Sandhurst-Military-Academy-Script/main/SandhurstMilitaryScript.lua'),true))()
    end
})

    Tabs.ScriptHub:AddButton({
    Title = "Prison Life Admin",
    Description = "Similar to infinite yield but for prison life only",
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/elliexmln/PrizzLife/main/pladmin.lua'))()
    end
})

    Tabs.ScriptHub:AddButton({
    Title = "Outlaster",
    Description = "Cheat Menu",
    Callback = function()
	loadstring(game:HttpGet('https://raw.githubusercontent.com/SlamminPig/6FootScripts/main/Scripts/Outlaster.lua'))();
    end
})

    Tabs.ScriptHub:AddButton({
    Title = "Aftermath",
    Description = "Item ESP",
    Callback = function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/BongCloudMaster/meetthegrahams/main/lurking.lua")())
    end
})

    Tabs.ScriptHub:AddButton({
    Title = "Dandy's World",
    Description = "OP Script",
    Callback = function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/Bac0nHck/Scripts/main/Dandy's%20World"))("t.me/arceusxscripts")
    end
})

    Tabs.ScriptHub:AddButton({
    Title = "Pet Sim 99",
    Description = "Zap Hub",
    Callback = function()
	loadstring(game:HttpGet('https://zaphub.xyz/ExecSolara'))()
    end
})

    Tabs.ScriptHub:AddButton({
    Title = "Trench War",
    Description = "A trench war script",
    Callback = function()
	loadstring(game:HttpGet('https://pastebin.com/raw/KfaKkDUf'))()
    end
})

    Tabs.ScriptHub:AddButton({
    Title = "",
    Description = "",
    Callback = function()
	
    end
})

-- SCRIPT INFO

Tabs.ScrInfo:AddParagraph({
    Title = "Reaper Hub Supported Scripts",
    Content = "The Strongest Battlegrounds\nAnime Fighters Simulator\nHide and Seek Extreme\nArm Wrestle Simulator\nToilet Tower Defense\nJujutsu Shenanigans\nLegends of Speed\nDungeon Quest\n+1 Blade Slayer\nEat the World\nA Dusty Trip\nPull a Sword\nGym League\nSlap Battles\nType Soul"
})



-- SETTINGS


    Tabs.Settings:AddButton({
    Title = "Print Test",
    Description = "Prints text in the output",
    Callback = function()
        print("Execution working!")
    end
})



end --END
-- Addons:
-- SaveManager (Allows you to have a configuration system)
-- InterfaceManager (Allows you to have a interface managment system)

-- Hand the library over to our managers
SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)

-- Ignore keys that are used by ThemeManager.
-- (we dont want configs to save themes, do we?)
SaveManager:IgnoreThemeSettings()

-- You can add indexes of elements the save manager should ignore
SaveManager:SetIgnoreIndexes({})

-- use case for doing it this way:
-- a script hub could have themes in a global folder
-- and game configs in a separate folder per game
InterfaceManager:SetFolder("FluentScriptHub")
SaveManager:SetFolder("FluentScriptHub/specific-game")

InterfaceManager:BuildInterfaceSection(Tabs.Settings)
SaveManager:BuildConfigSection(Tabs.Settings)


Window:SelectTab(1)

-- You can use the SaveManager:LoadAutoloadConfig() to load a config
-- which has been marked to be one that auto loads!
SaveManager:LoadAutoloadConfig()

Window:Dialog({
    Title = "Plasma has loaded!",
    Content = "Always remember to exploit on alt!",
    Buttons = {
        { 
            Title = "Copy Discord Invite!",
            Callback = function()
                print("You better have joined our discord ;)")
		setclipboard("https://discord.gg/abF85cPA")
            end 
        }
    }
})
