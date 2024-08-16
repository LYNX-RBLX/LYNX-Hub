local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))

-- // Services
local Workspace = game:GetService("Workspace")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local StarterGui = game:GetService("StarterGui")
local StarterPack = game:GetService("StarterPack")
local SoundService = game:GetService("SoundService")
local Lighting = game:GetService("Lighting")
local Debris = game:GetService("Debris")
local HttpService = game:GetService("HttpService")
local TeleportService = game:GetService("TeleportService")
local BadgeService = game:GetService("BadgeService")
local GroupService = game:GetService("GroupService")
local DataStoreService = game:GetService("DataStoreService")
local PathfindingService = game:GetService("PathfindingService")
local ProximityPromptService = game:GetService("ProximityPromptService")
local MarketplaceService = game:GetService("MarketplaceService")
local Chat = game:GetService("Chat")
local TextService = game:GetService("TextService")
local GuiService = game:GetService("GuiService")
local AnalyticsService = game:GetService("AnalyticsService")
local LocalizationService = game:GetService("LocalizationService")
local ContentProvider = game:GetService("ContentProvider")
local HapticService = game:GetService("HapticService")
local PolicyService = game:GetService("PolicyService")
local ContextActionService = game:GetService("ContextActionService")
local Selection = game:GetService("Selection")

if game.PlaceId == 1 then

else
    local Window = Rayfield:CreateWindow({
        Name = "👾 LYNX Hub",
        LoadingTitle = "Loading LYNX Hub",
        LoadingSubtitle = "by Lynx",
        ConfigurationSaving = {
           Enabled = true,
           FolderName = "LYNXHUBDATA", -- Create a custom folder for your hub/game
           FileName = "Lynx Hub"
        },
        Discord = {
           Enabled = false,
           Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD
           RememberJoins = true -- Set this to false to make them join the discord every time they load it up
        },
        KeySystem = true, -- Set this to true to use our key system
        KeySettings = {
           Title = "LYNX Hub | 🔑 Key",
           Subtitle = "🔑 Key System",
           Note = "Visit Github Page to see instructions on how to get a key. https://github.com/LYNXPLOITS/LYNX-Hub/blob/main/README.md",
           FileName = "KeySystemMain", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
           SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
           GrabKeyFromSite = true, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
           Key = {"https://raw.githubusercontent.com/LYNXPLOITS/LYNX-Hub/keys/working-keys.txt"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
        }
    })
    
    local MainTab = Window:CreateTab("🏡 Home", nil) -- Title, Image
    local MainSection = MainTab:CreateSection("Main")

    Rayfield:Notify({
        Title = "🔑 Key Approved",
        Content = "The key you have inputted has been approved. Please keep in mind that LYNX Hub is brand new, and does not have all the features you would expect.",
        Duration = 5,
        Image = nil,
        Actions = { -- Notification Buttons
           --Ignore = {
            --  Name = "Okay!",
            --  Callback = function()
            --  print("The user tapped Okay!")
           --end
        --},
     },
     })

    local Button2 = MainTab:CreateButton({
        Name = "Infinite Yield",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()

            Rayfield:Notify({
                Title = "✅ Success",
                Content = "Infinite Yield has been launched.",
                Duration = 5,
                Image = nil,
                Actions = { -- Notification Buttons
                   --Ignore = {
                    --  Name = "Okay!",
                    --  Callback = function()
                    --  print("The user tapped Okay!")
                   --end
                --},
             },
             })
        end,
     })

     local RunService = game:GetService("RunService")
     local LocalPlayer = Players.LocalPlayer

     LocalPlayer.FollowConnection = nil
     
     local Dropdown = MainTab:CreateDropdown({
         Name = "Follow Player",
         Options = {},
         CurrentOption = "",
         MultipleOptions = false,
         Flag = "Dropdown1",
         Callback = function(Option)
             -- Clear any existing connections
             if LocalPlayer.FollowConnection then
                 LocalPlayer.FollowConnection:Disconnect()
             end
     
             -- Find the selected player
             local selectedPlayer = Players:FindFirstChild(Option[1])
     
             -- Set up follow logic if the player exists
             if selectedPlayer then
                 LocalPlayer.FollowConnection = RunService.Stepped:Connect(function()
                     if selectedPlayer.Character and selectedPlayer.Character:FindFirstChild("HumanoidRootPart") then
                         LocalPlayer.Character:SetPrimaryPartCFrame(selectedPlayer.Character.HumanoidRootPart.CFrame)
                     end
                 end)
             end
         end,
     })
     
     -- Populate the dropdown with current players
     local playerNames = {}
     for _, player in ipairs(Players:GetPlayers()) do
         table.insert(playerNames, player.Name)
     end
     Dropdown:Set(playerNames)

     local Button = MainTab:CreateButton({
        Name = "Toggle Infinite Jump",
        Callback = function()
            _G.infinjump = not _G.infinjump

            if _G.infinJumpStarted == nil then
                --Ensures this only runs once to save resources
                _G.infinJumpStarted = true
            
                --The actual infinite jump
                local plr = game:GetService('Players').LocalPlayer
                local m = plr:GetMouse()
                m.KeyDown:connect(function(k)
                    if _G.infinjump then
                        if k:byte() == 32 then
                        humanoid = game:GetService'Players'.LocalPlayer.Character:FindFirstChildOfClass('Humanoid')
                        humanoid:ChangeState('Jumping')
                        wait()
                        humanoid:ChangeState('Seated')
                        end
                    end
                end)
            end

            Rayfield:Notify({
                Title = "✅ Success",
                Content = "Infinite Jump has successfully been toggled.",
                Duration = 5,
                Image = nil,
                Actions = { -- Notification Buttons
                   --Ignore = {
                    --  Name = "Okay!",
                    --  Callback = function()
                    --  print("The user tapped Okay!")
                   --end
                --},
             },
             })
        end,
     })

    local Slider = MainTab:CreateSlider({
        Name = "WalkSpeed",
        Range = {0, 500},
        Increment = 1,
        Suffix = "WalkSpeed",
        CurrentValue = 16,
        Flag = "SliderWalkSpeed1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
        Callback = function(Value)
            Players.LocalPlayer.Character.Humanoid.WalkSpeed.Value = (Value)
            Rayfield:Notify({
                Title = "✅ Success",
                Content = "WalkSpeed has been successfully updated.",
                Duration = 5,
                Image = nil,
                Actions = { -- Notification Buttons
                   --Ignore = {
                    --  Name = "Okay!",
                    --  Callback = function()
                    --  print("The user tapped Okay!")
                   --end
                --},
             },
             })
        -- The function that takes place when the slider changes
        -- The variable (Value) is a number which correlates to the value the slider is currently at
        end,
     })

     local Slider2 = MainTab:CreateSlider({
        Name = "JumpPower",
        Range = {0, 500},
        Increment = 1,
        Suffix = "Jump",
        CurrentValue = 50,
        Flag = "SliderJumpSettings", 
        Callback = function(Value)
            local humanoid = Players.LocalPlayer.Character.Humanoid
            humanoid.UseJumpPower = true
            humanoid.JumpPower = Value
    
            Rayfield:Notify({
                Title = "✅ Success",
                Content = "Jump Power has been successfully updated.",
                Duration = 5,
                Image = nil,
                Actions = { -- Notification Buttons
                   --Ignore = {
                    --  Name = "Okay!",
                    --  Callback = function()
                    --  print("The user tapped Okay!")
                   --end
                --},
             },
             })
        end,
    })    
end
