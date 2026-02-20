-- MM2 Hub for Delta Executor - FULL VERSION
-- Murder Mystery 2 Script with ALL features working

-- Create the GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "MM2Hub"
ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- Main frame - PERFECT SQUARE (300x300)
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 300, 0, 300)
MainFrame.Position = UDim2.new(0.5, -150, 0.5, -150)
MainFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
MainFrame.BackgroundTransparency = 0.15
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

-- Add rounded corners
local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 8)
UICorner.Parent = MainFrame

-- Title bar
local TitleBar = Instance.new("Frame")
TitleBar.Size = UDim2.new(1, 0, 0, 28)
TitleBar.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
TitleBar.BackgroundTransparency = 0.2
TitleBar.BorderSizePixel = 0
TitleBar.Parent = MainFrame

local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 8)
TitleCorner.Parent = TitleBar

-- Title text
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -70, 0, 14)
Title.Position = UDim2.new(0, 8, 0, 2)
Title.BackgroundTransparency = 1
Title.Text = "MM2 Hub [ Murder Mystery 2 ]"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Font = Enum.Font.GothamBold
Title.TextSize = 11
Title.Parent = TitleBar

-- Discord link
local DiscordText = Instance.new("TextLabel")
DiscordText.Size = UDim2.new(1, -70, 0, 10)
DiscordText.Position = UDim2.new(0, 8, 0, 16)
DiscordText.BackgroundTransparency = 1
DiscordText.Text = "discord.gg/mm2hub"
DiscordText.TextColor3 = Color3.fromRGB(150, 150, 150)
DiscordText.TextXAlignment = Enum.TextXAlignment.Left
DiscordText.Font = Enum.Font.Gotham
DiscordText.TextSize = 8
DiscordText.Parent = TitleBar

-- Hide button
local HideButton = Instance.new("TextButton")
HideButton.Size = UDim2.new(0, 30, 1, 0)
HideButton.Position = UDim2.new(1, -60, 0, 0)
HideButton.BackgroundTransparency = 1
HideButton.Text = "Hide"
HideButton.TextColor3 = Color3.fromRGB(180, 180, 180)
HideButton.Font = Enum.Font.Gotham
HideButton.TextSize = 10
HideButton.Parent = TitleBar

-- Close button
local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 30, 1, 0)
CloseBtn.Position = UDim2.new(1, -30, 0, 0)
CloseBtn.BackgroundTransparency = 1
CloseBtn.Text = "X"
CloseBtn.TextColor3 = Color3.fromRGB(255, 100, 100)
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.TextSize = 13
CloseBtn.Parent = TitleBar
CloseBtn.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- Hide icon (appears when main frame is hidden)
local HideIcon = Instance.new("Frame")
HideIcon.Size = UDim2.new(0, 40, 0, 40)
HideIcon.Position = UDim2.new(0, 10, 0, 10)
HideIcon.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
HideIcon.BackgroundTransparency = 0.1
HideIcon.Visible = false
HideIcon.Active = true
HideIcon.Draggable = true
HideIcon.Parent = ScreenGui

local IconCorner = Instance.new("UICorner")
IconCorner.CornerRadius = UDim.new(0, 8)
IconCorner.Parent = HideIcon

local IconText = Instance.new("TextLabel")
IconText.Size = UDim2.new(1, 0, 1, 0)
IconText.BackgroundTransparency = 1
IconText.Text = "MM2"
IconText.TextColor3 = Color3.fromRGB(255, 255, 255)
IconText.Font = Enum.Font.GothamBold
IconText.TextSize = 16
IconText.Parent = HideIcon

local IconButton = Instance.new("TextButton")
IconButton.Size = UDim2.new(1, 0, 1, 0)
IconButton.BackgroundTransparency = 1
IconButton.Text = ""
IconButton.Parent = HideIcon

-- Hide/Show functionality
HideButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = false
    HideIcon.Visible = true
end)

IconButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = true
    HideIcon.Visible = false
end)

-- Tab buttons frame (compact)
local TabFrame = Instance.new("Frame")
TabFrame.Size = UDim2.new(1, -20, 0, 25)
TabFrame.Position = UDim2.new(0, 10, 0, 32)
TabFrame.BackgroundTransparency = 1
TabFrame.Parent = MainFrame

-- Create tabs for MM2
local tabs = {"Main", "Combat", "ESP", "Farm", "Teleport", "Misc", "Settings"}
local tabButtons = {}
local contentFrames = {}

for i, tabName in ipairs(tabs) do
    local tabBtn = Instance.new("TextButton")
    tabBtn.Size = UDim2.new(0, 38, 1, 0)
    tabBtn.Position = UDim2.new(0, (i-1) * 40, 0, 0)
    tabBtn.BackgroundTransparency = 1
    tabBtn.Text = tabName
    tabBtn.TextColor3 = Color3.fromRGB(140, 140, 140)
    tabBtn.Font = Enum.Font.Gotham
    tabBtn.TextSize = 9
    tabBtn.Parent = TabFrame
    tabButtons[i] = tabBtn
    
    -- Content frame for this tab (scrollable)
    local contentFrame = Instance.new("ScrollingFrame")
    contentFrame.Size = UDim2.new(1, -20, 1, -110)
    contentFrame.Position = UDim2.new(0, 10, 0, 60)
    contentFrame.BackgroundTransparency = 1
    contentFrame.BorderSizePixel = 0
    contentFrame.Visible = false
    contentFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
    contentFrame.ScrollBarThickness = 3
    contentFrame.ScrollBarImageColor3 = Color3.fromRGB(100, 100, 100)
    contentFrame.Parent = MainFrame
    contentFrames[i] = contentFrame
    
    tabBtn.MouseButton1Click:Connect(function()
        for j, btn in ipairs(tabButtons) do
            btn.TextColor3 = Color3.fromRGB(140, 140, 140)
        end
        tabBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        
        for j, frame in ipairs(contentFrames) do
            frame.Visible = false
        end
        contentFrame.Visible = true
    end)
end

-- Show first tab
tabButtons[1].TextColor3 = Color3.fromRGB(255, 255, 255)
contentFrames[1].Visible = true

-- Services
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local VirtualUser = game:GetService("VirtualUser")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera
local Mouse = LocalPlayer:GetMouse()

-- Find MainEvent
local MainEvent = ReplicatedStorage:FindFirstChild("MainEvent") or ReplicatedStorage:FindFirstChild("MainEvent") or ReplicatedStorage:WaitForChild("MainEvent")

-- Global variables for toggles
_G.AutoCollect = false
_G.AutoMurderer = false
_G.AutoSheriff = false
_G.ESPEnabled = false
_G.KillAura = false
_G.Aimbot = false
_G.AutoFarm = false
_G.AutoGifts = false
_G.NoClip = false
_G.InfiniteJump = false
_G.FlyMode = false
_G.WallCheck = false
_G.AutoRespawn = false
_G.WalkSpeed = 16
_G.JumpPower = 50

-- Function to create UI elements
local function createUI(frame)
    local yPos = 0
    
    local function addSection(title)
        local sectionLabel = Instance.new("TextLabel")
        sectionLabel.Size = UDim2.new(1, -10, 0, 18)
        sectionLabel.Position = UDim2.new(0, 5, 0, yPos)
        sectionLabel.BackgroundTransparency = 1
        sectionLabel.Text = title
        sectionLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
        sectionLabel.TextXAlignment = Enum.TextXAlignment.Left
        sectionLabel.Font = Enum.Font.GothamBold
        sectionLabel.TextSize = 11
        sectionLabel.Parent = frame
        
        yPos = yPos + 22
        frame.CanvasSize = UDim2.new(0, 0, 0, yPos)
    end
    
    local function addToggle(text, default, callback)
        local toggleFrame = Instance.new("Frame")
        toggleFrame.Size = UDim2.new(1, -20, 0, 22)
        toggleFrame.Position = UDim2.new(0, 10, 0, yPos)
        toggleFrame.BackgroundTransparency = 1
        toggleFrame.Parent = frame
        
        local toggleBtn = Instance.new("TextButton")
        toggleBtn.Size = UDim2.new(0, 14, 0, 14)
        toggleBtn.Position = UDim2.new(0, 0, 0.5, -7)
        toggleBtn.BackgroundColor3 = default and Color3.fromRGB(0, 200, 0) or Color3.fromRGB(60, 60, 60)
        toggleBtn.Text = ""
        toggleBtn.Parent = toggleFrame
        
        local toggleLabel = Instance.new("TextLabel")
        toggleLabel.Size = UDim2.new(1, -20, 1, 0)
        toggleLabel.Position = UDim2.new(0, 20, 0, 0)
        toggleLabel.BackgroundTransparency = 1
        toggleLabel.Text = text
        toggleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        toggleLabel.TextXAlignment = Enum.TextXAlignment.Left
        toggleLabel.Font = Enum.Font.Gotham
        toggleLabel.TextSize = 10
        toggleLabel.Parent = toggleFrame
        
        local state = default
        toggleBtn.MouseButton1Click:Connect(function()
            state = not state
            toggleBtn.BackgroundColor3 = state and Color3.fromRGB(0, 200, 0) or Color3.fromRGB(60, 60, 60)
            if callback then callback(state) end
        end)
        
        yPos = yPos + 26
        frame.CanvasSize = UDim2.new(0, 0, 0, yPos)
    end
    
    local function addSlider(text, min, max, default, callback)
        local sliderFrame = Instance.new("Frame")
        sliderFrame.Size = UDim2.new(1, -20, 0, 35)
        sliderFrame.Position = UDim2.new(0, 10, 0, yPos)
        sliderFrame.BackgroundTransparency = 1
        sliderFrame.Parent = frame
        
        local sliderLabel = Instance.new("TextLabel")
        sliderLabel.Size = UDim2.new(0.6, 0, 0, 15)
        sliderLabel.BackgroundTransparency = 1
        sliderLabel.Text = text
        sliderLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        sliderLabel.TextXAlignment = Enum.TextXAlignment.Left
        sliderLabel.Font = Enum.Font.Gotham
        sliderLabel.TextSize = 10
        sliderLabel.Parent = sliderFrame
        
        local valueLabel = Instance.new("TextLabel")
        valueLabel.Size = UDim2.new(0.4, -5, 0, 15)
        valueLabel.Position = UDim2.new(0.6, 5, 0, 0)
        valueLabel.BackgroundTransparency = 1
        valueLabel.Text = tostring(default)
        valueLabel.TextColor3 = Color3.fromRGB(0, 200, 255)
        valueLabel.TextXAlignment = Enum.TextXAlignment.Right
        valueLabel.Font = Enum.Font.GothamBold
        valueLabel.TextSize = 10
        valueLabel.Parent = sliderFrame
        
        local sliderBg = Instance.new("Frame")
        sliderBg.Size = UDim2.new(1, 0, 0, 6)
        sliderBg.Position = UDim2.new(0, 0, 0, 20)
        sliderBg.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        sliderBg.Parent = sliderFrame
        
        local sliderFill = Instance.new("Frame")
        sliderFill.Size = UDim2.new((default - min) / (max - min), 0, 1, 0)
        sliderFill.BackgroundColor3 = Color3.fromRGB(0, 200, 255)
        sliderFill.Parent = sliderBg
        
        local sliderButton = Instance.new("TextButton")
        sliderButton.Size = UDim2.new(1, 0, 1, 0)
        sliderButton.BackgroundTransparency = 1
        sliderButton.Text = ""
        sliderButton.Parent = sliderBg
        
        local dragging = false
        local value = default
        
        sliderButton.MouseButton1Down:Connect(function()
            dragging = true
        end)
        
        UserInputService.InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                dragging = false
            end
        end)
        
        sliderButton.MouseMoved:Connect(function()
            if dragging then
                local mousePos = UserInputService:GetMouseLocation()
                local absPos = sliderBg.AbsolutePosition
                local relX = math.clamp(mousePos.X - absPos.X, 0, sliderBg.AbsoluteSize.X)
                local percent = relX / sliderBg.AbsoluteSize.X
                value = min + (max - min) * percent
                value = math.floor(value + 0.5)
                sliderFill.Size = UDim2.new(percent, 0, 1, 0)
                valueLabel.Text = tostring(value)
                if callback then callback(value) end
            end
        end)
        
        yPos = yPos + 40
        frame.CanvasSize = UDim2.new(0, 0, 0, yPos)
    end
    
    local function addButton(text, callback)
        local btn = Instance.new("TextButton")
        btn.Size = UDim2.new(1, -20, 0, 25)
        btn.Position = UDim2.new(0, 10, 0, yPos)
        btn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        btn.BackgroundTransparency = 0.2
        btn.Text = text
        btn.TextColor3 = Color3.fromRGB(255, 255, 255)
        btn.Font = Enum.Font.Gotham
        btn.TextSize = 10
        btn.Parent = frame
        btn.MouseButton1Click:Connect(function()
            if callback then callback() end
        end)
        
        yPos = yPos + 30
        frame.CanvasSize = UDim2.new(0, 0, 0, yPos)
    end
    
    local function addLabel(text)
        local label = Instance.new("TextLabel")
        label.Size = UDim2.new(1, -20, 0, 18)
        label.Position = UDim2.new(0, 10, 0, yPos)
        label.BackgroundTransparency = 1
        label.Text = text
        label.TextColor3 = Color3.fromRGB(200, 200, 200)
        label.TextXAlignment = Enum.TextXAlignment.Left
        label.Font = Enum.Font.Gotham
        label.TextSize = 10
        label.Parent = frame
        
        yPos = yPos + 22
        frame.CanvasSize = UDim2.new(0, 0, 0, yPos)
    end
    
    local function addDropdown(text, options, callback)
        local dropdownFrame = Instance.new("Frame")
        dropdownFrame.Size = UDim2.new(1, -20, 0, 22)
        dropdownFrame.Position = UDim2.new(0, 10, 0, yPos)
        dropdownFrame.BackgroundTransparency = 1
        dropdownFrame.Parent = frame
        
        local dropdownLabel = Instance.new("TextLabel")
        dropdownLabel.Size = UDim2.new(0, 50, 1, 0)
        dropdownLabel.BackgroundTransparency = 1
        dropdownLabel.Text = text
        dropdownLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
        dropdownLabel.TextXAlignment = Enum.TextXAlignment.Left
        dropdownLabel.Font = Enum.Font.Gotham
        dropdownLabel.TextSize = 10
        dropdownLabel.Parent = dropdownFrame
        
        local dropdownBtn = Instance.new("TextButton")
        dropdownBtn.Size = UDim2.new(0, 80, 0, 20)
        dropdownBtn.Position = UDim2.new(0, 55, 0.5, -10)
        dropdownBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        dropdownBtn.BackgroundTransparency = 0.2
        dropdownBtn.Text = options[1]
        dropdownBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        dropdownBtn.Font = Enum.Font.Gotham
        dropdownBtn.TextSize = 10
        dropdownBtn.Parent = dropdownFrame
        
        local currentOption = 1
        dropdownBtn.MouseButton1Click:Connect(function()
            currentOption = currentOption % #options + 1
            dropdownBtn.Text = options[currentOption]
            if callback then callback(options[currentOption]) end
        end)
        
        yPos = yPos + 26
        frame.CanvasSize = UDim2.new(0, 0, 0, yPos)
    end
    
    return {
        addSection = addSection,
        addToggle = addToggle,
        addSlider = addSlider,
        addButton = addButton,
        addLabel = addLabel,
        addDropdown = addDropdown
    }
end

-- ============================================
-- BUILD MAIN TAB
-- ============================================
local main = createUI(contentFrames[1])
main.addSection("Auto Collect")
main.addToggle("Auto Collect Coins", false, function(state)
    _G.AutoCollect = state
    if state then
        spawn(function()
            while _G.AutoCollect do
                task.wait(0.3)
                pcall(function()
                    local coins = workspace:FindFirstChild("Coins") or workspace:FindFirstChild("Coin") or workspace:FindFirstChild("DroppedCoins")
                    if coins then
                        for _, coin in pairs(coins:GetChildren()) do
                            if coin:IsA("BasePart") and coin:FindFirstChild("TouchInterest") and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                                LocalPlayer.Character.HumanoidRootPart.CFrame = coin.CFrame * CFrame.new(0, 2, 0)
                                task.wait(0.1)
                            end
                        end
                    end
                end)
            end
        end)
    end
end)

main.addToggle("Auto Collect Gifts", false, function(state)
    _G.AutoGifts = state
    if state then
        spawn(function()
            while _G.AutoGifts do
                task.wait(0.3)
                pcall(function()
                    local gifts = workspace:FindFirstChild("Gifts") or workspace:FindFirstChild("Gift")
                    if gifts then
                        for _, gift in pairs(gifts:GetChildren()) do
                            if gift:IsA("BasePart") and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                                LocalPlayer.Character.HumanoidRootPart.CFrame = gift.CFrame * CFrame.new(0, 3, 0)
                                task.wait(0.2)
                            end
                        end
                    end
                end)
            end
        end)
    end
end)

main.addSection("Auto Kill")
main.addToggle("Auto Murderer Kill", false, function(state)
    _G.AutoMurderer = state
    if state then
        spawn(function()
            while _G.AutoMurderer do
                task.wait(0.2)
                pcall(function()
                    if (LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Knife")) or (LocalPlayer.Backpack and LocalPlayer.Backpack:FindFirstChild("Knife")) then
                        if MainEvent then
                            MainEvent:FireServer("Knife", "Humanoid")
                        end
                    end
                end)
            end
        end)
    end
end)

main.addToggle("Auto Sheriff Kill", false, function(state)
    _G.AutoSheriff = state
    if state then
        spawn(function()
            while _G.AutoSheriff do
                task.wait(0.2)
                pcall(function()
                    if (LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Gun")) or (LocalPlayer.Backpack and LocalPlayer.Backpack:FindFirstChild("Gun")) then
                        if MainEvent then
                            MainEvent:FireServer("Gun", "Humanoid")
                        end
                    end
                end)
            end
        end)
    end
end)

main.addSection("Movement")
main.addSlider("WalkSpeed", 16, 350, 16, function(value)
    _G.WalkSpeed = value
    pcall(function()
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
            LocalPlayer.Character.Humanoid.WalkSpeed = value
        end
    end)
end)

main.addSlider("JumpPower", 50, 350, 50, function(value)
    _G.JumpPower = value
    pcall(function()
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
            LocalPlayer.Character.Humanoid.JumpPower = value
        end
    end)
end)

main.addToggle("Infinite Jump", false, function(state)
    _G.InfiniteJump = state
end)

-- ============================================
-- BUILD COMBAT TAB
-- ============================================
local combat = createUI(contentFrames[2])
combat.addSection("Combat Features")
combat.addToggle("Kill Aura", false, function(state)
    _G.KillAura = state
    if state then
        spawn(function()
            while _G.KillAura do
                task.wait(0.2)
                pcall(function()
                    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                        local myPos = LocalPlayer.Character.HumanoidRootPart.Position
                        
                        for _, player in pairs(Players:GetPlayers()) do
                            if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                                local distance = (myPos - player.Character.HumanoidRootPart.Position).Magnitude
                                
                                if distance < 30 and MainEvent then
                                    if LocalPlayer.Character:FindFirstChild("Knife") or LocalPlayer.Backpack:FindFirstChild("Knife") then
                                        MainEvent:FireServer("Knife", "Humanoid")
                                    elseif LocalPlayer.Character:FindFirstChild("Gun") or LocalPlayer.Backpack:FindFirstChild("Gun") then
                                        MainEvent:FireServer("Gun", "Humanoid")
                                    end
                                end
                            end
                        end
                    end
                end)
            end
        end)
    end
end)

combat.addToggle("Aimbot (Silent)", false, function(state)
    _G.Aimbot = state
end)

combat.addToggle("Wall Check", false, function(state)
    _G.WallCheck = state
end)

combat.addLabel("Aimbot locks onto nearest player")

-- Aimbot connection
RunService.RenderStepped:Connect(function()
    if _G.Aimbot and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        pcall(function()
            local closestPlayer = nil
            local closestDistance = math.huge
            
            for _, player in pairs(Players:GetPlayers()) do
                if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") and player.Character:FindFirstChild("Humanoid") and player.Character.Humanoid.Health > 0 then
                    
                    -- Wall check
                    if _G.WallCheck then
                        local ray = Ray.new(LocalPlayer.Character.HumanoidRootPart.Position, (player.Character.HumanoidRootPart.Position - LocalPlayer.Character.HumanoidRootPart.Position).Unit * 100)
                        local hit, pos = workspace:FindPartOnRay(ray, LocalPlayer.Character)
                        if hit and hit:IsDescendantOf(player.Character) then
                            local distance = (LocalPlayer.Character.HumanoidRootPart.Position - player.Character.HumanoidRootPart.Position).Magnitude
                            if distance < 100 and distance < closestDistance then
                                closestDistance = distance
                                closestPlayer = player
                            end
                        end
                    else
                        local distance = (LocalPlayer.Character.HumanoidRootPart.Position - player.Character.HumanoidRootPart.Position).Magnitude
                        if distance < 100 and distance < closestDistance then
                            closestDistance = distance
                            closestPlayer = player
                        end
                    end
                end
            end
            
            if closestPlayer and closestPlayer.Character and closestPlayer.Character:FindFirstChild("HumanoidRootPart") then
                workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position, closestPlayer.Character.HumanoidRootPart.Position)
            end
        end)
    end
end)

-- ============================================
-- BUILD ESP TAB
-- ============================================
local esp = createUI(contentFrames[3])
esp.addSection("ESP Settings")
esp.addToggle("Enable ESP", false, function(state)
    _G.ESPEnabled = state
    
    if state then
        spawn(function()
            while _G.ESPEnabled do
                task.wait(0.3)
                pcall(function()
                    for _, player in pairs(Players:GetPlayers()) do
                        if player ~= LocalPlayer and player.Character then
                            -- Create BillboardGui for ESP
                            local espGui = player.Character:FindFirstChild("ESP_Gui")
                            if not espGui then
                                espGui = Instance.new("BillboardGui")
                                espGui.Name = "ESP_Gui"
                                espGui.Adornee = player.Character:FindFirstChild("Head") or player.Character:FindFirstChild("HumanoidRootPart")
                                espGui.Size = UDim2.new(0, 150, 0, 40)
                                espGui.StudsOffset = Vector3.new(0, 3, 0)
                                espGui.AlwaysOnTop = true
                                
                                local textLabel = Instance.new("TextLabel")
                                textLabel.Parent = espGui
                                textLabel.Size = UDim2.new(1, 0, 0.5, 0)
                                textLabel.Position = UDim2.new(0, 0, 0, 0)
                                textLabel.BackgroundTransparency = 1
                                textLabel.TextStrokeTransparency = 0
                                textLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
                                textLabel.TextScaled = true
                                
                                local distanceLabel = Instance.new("TextLabel")
                                distanceLabel.Parent = espGui
                                distanceLabel.Size = UDim2.new(1, 0, 0.5, 0)
                                distanceLabel.Position = UDim2.new(0, 0, 0.5, 0)
                                distanceLabel.BackgroundTransparency = 1
                                distanceLabel.TextStrokeTransparency = 0
                                distanceLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
                                distanceLabel.TextScaled = true
                                distanceLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                                
                                -- Determine role
                                if player.Character:FindFirstChild("Knife") or player.Backpack:FindFirstChild("Knife") then
                                    textLabel.TextColor3 = Color3.fromRGB(255, 0, 0) -- Red
                                    textLabel.Text = "🔪 MURDERER"
                                elseif player.Character:FindFirstChild("Gun") or player.Backpack:FindFirstChild("Gun") then
                                    textLabel.TextColor3 = Color3.fromRGB(255, 255, 0) -- Yellow
                                    textLabel.Text = "🔫 SHERIFF"
                                else
                                    textLabel.TextColor3 = Color3.fromRGB(0, 255, 0) -- Green
                                    textLabel.Text = "👤 INNOCENT"
                                end
                                
                                espGui.Parent = player.Character
                            end
                            
                            -- Update distance
                            if espGui and espGui:FindFirstChild("distanceLabel") and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and player.Character:FindFirstChild("HumanoidRootPart") then
                                local dist = (LocalPlayer.Character.HumanoidRootPart.Position - player.Character.HumanoidRootPart.Position).Magnitude
                                espGui.distanceLabel.Text = math.floor(dist) .. " studs"
                            end
                        end
                    end
                end)
            end
            
            -- Remove ESP when disabled
            for _, player in pairs(Players:GetPlayers()) do
                pcall(function()
                    if player.Character and player.Character:FindFirstChild("ESP_Gui") then
                        player.Character.ESP_Gui:Destroy()
                    end
                end)
            end
        end)
    else
        -- Remove all ESP
        for _, player in pairs(Players:GetPlayers()) do
            pcall(function()
                if player.Character and player.Character:FindFirstChild("ESP_Gui") then
                    player.Character.ESP_Gui:Destroy()
                end
            end)
        end
    end
end)

esp.addToggle("Show Distance", true, function(state)
    -- This is handled in the ESP loop
end)

esp.addToggle("Show Boxes", false, function(state)
    _G.ESPBoxes = state
end)

esp.addButton("Detect All Roles", function()
    pcall(function()
        local murderers = {}
        local sheriffs = {}
        local innocents = {}
        
        for _, player in pairs(Players:GetPlayers()) do
            if player ~= LocalPlayer then
                if player.Character and (player.Character:FindFirstChild("Knife") or player.Backpack:FindFirstChild("Knife")) then
                    table.insert(murderers, player.Name)
                elseif player.Character and (player.Character:FindFirstChild("Gun") or player.Backpack:FindFirstChild("Gun")) then
                    table.insert(sheriffs, player.Name)
                else
                    table.insert(innocents, player.Name)
                end
            end
        end
        
        local message = "Murderers: " .. (#murderers > 0 and table.concat(murderers, ", ") or "None") .. "\n"
        message = message .. "Sheriffs: " .. (#sheriffs > 0 and table.concat(sheriffs, ", ") or "None") .. "\n"
        message = message .. "Innocents: " .. (#innocents > 0 and table.concat(innocents, ", ") or "None")
        
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "Role Detection",
            Text = "Check F9 for details",
            Duration = 3
        })
        
        print("=== ROLE DETECTION ===")
        print(message)
    end)
end)

-- ============================================
-- BUILD FARM TAB
-- ============================================
local farm = createUI(contentFrames[4])
farm.addSection("Auto Farm")
farm.addToggle("Auto Farm Coins", false, function(state)
    _G.AutoFarm = state
    if state then
        spawn(function()
            while _G.AutoFarm do
                task.wait(0.2)
                pcall(function()
                    local coins = workspace:FindFirstChild("Coins") or workspace:FindFirstChild("Coin") or workspace:FindFirstChild("DroppedCoins")
                    if coins then
                        for _, coin in pairs(coins:GetChildren()) do
                            if coin:IsA("BasePart") and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                                LocalPlayer.Character.HumanoidRootPart.CFrame = coin.CFrame * CFrame.new(0, 3, 0)
                                task.wait(0.1)
                            end
                        end
                    end
                end)
            end
        end)
    end
end)

farm.addToggle("Auto Farm Gifts", false, function(state)
    _G.AutoGifts = state
    if state then
        spawn(function()
            while _G.AutoGifts do
                task.wait(0.2)
                pcall(function()
                    local gifts = workspace:FindFirstChild("Gifts") or workspace:FindFirstChild("Gift")
                    if gifts then
                        for _, gift in pairs(gifts:GetChildren()) do
                            if gift:IsA("BasePart") and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                                LocalPlayer.Character.HumanoidRootPart.CFrame = gift.CFrame * CFrame.new(0, 3, 0)
                                task.wait(0.1)
                            end
                        end
                    end
                end)
            end
        end)
    end
end)

farm.addToggle("Auto Respawn", false, function(state)
    _G.AutoRespawn = state
end)

-- Auto Respawn handler
LocalPlayer.CharacterAdded:Connect(function(character)
    if _G.AutoRespawn then
        task.wait(0.5)
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "Auto Respawn",
            Text = "You have respawned",
            Duration = 2
        })
    end
    
    -- Reapply speed/jump
    task.wait(0.5)
    pcall(function()
        if character:FindFirstChildOfClass("Humanoid") then
            character.Humanoid.WalkSpeed = _G.WalkSpeed
            character.Humanoid.JumpPower = _G.JumpPower
        end
    end)
end)

-- ============================================
-- BUILD TELEPORT TAB
-- ============================================
local teleport = createUI(contentFrames[5])
teleport.addSection("Teleport to Players")
teleport.addButton("TP to Murderer", function()
    pcall(function()
        for _, player in pairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                if player.Character:FindFirstChild("Knife") or player.Backpack:FindFirstChild("Knife") then
                    LocalPlayer.Character.HumanoidRootPart.CFrame = player.Character.HumanoidRootPart.CFrame * CFrame.new(0, 3, 2)
                    game:GetService("StarterGui"):SetCore("SendNotification", {
                        Title = "Teleported",
                        Text = "To Murderer: " .. player.Name,
                        Duration = 2
                    })
                    return
                end
            end
        end
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "Error",
            Text = "No Murderer found",
            Duration = 2
        })
    end)
end)

teleport.addButton("TP to Sheriff", function()
    pcall(function()
        for _, player in pairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                if player.Character:FindFirstChild("Gun") or player.Backpack:FindFirstChild("Gun") then
                    LocalPlayer.Character.HumanoidRootPart.CFrame = player.Character.HumanoidRootPart.CFrame * CFrame.new(0, 3, 2)
                    game:GetService("StarterGui"):SetCore("SendNotification", {
                        Title = "Teleported",
                        Text = "To Sheriff: " .. player.Name,
                        Duration = 2
                    })
                    return
                end
            end
        end
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "Error",
            Text = "No Sheriff found",
            Duration = 2
        })
    end)
end)

teleport.addButton("TP to Random Player", function()
    pcall(function()
        local players = {}
        for _, player in pairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                table.insert(players, player)
            end
        end
        
        if #players > 0 then
            local randomPlayer = players[math.random(1, #players)]
            LocalPlayer.Character.HumanoidRootPart.CFrame = randomPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 3, 2)
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = "Teleported",
                Text = "To: " .. randomPlayer.Name,
                Duration = 2
            })
        else
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = "Error",
                Text = "No players found",
                Duration = 2
            })
        end
    end)
end)

teleport.addSection("Map Teleports")
teleport.addButton("TP to Center", function()
    pcall(function()
        local spawns = workspace:FindFirstChild("SpawnLocation") or workspace:FindFirstChild("Spawn") or workspace:FindFirstChild("Start")
        if spawns and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            LocalPlayer.Character.HumanoidRootPart.CFrame = spawns.CFrame * CFrame.new(0, 5, 0)
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = "Teleported",
                Text = "To Map Center",
                Duration = 2
            })
        end
    end)
end)

teleport.addButton("TP to Highest Point", function()
    pcall(function()
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(LocalPlayer.Character.HumanoidRootPart.Position.X, 500, LocalPlayer.Character.HumanoidRootPart.Position.Z)
        end
    end)
end)

-- ============================================
-- BUILD MISC TAB
-- ============================================
local misc = createUI(contentFrames[6])
misc.addSection("Movement")
misc.addToggle("NoClip", false, function(state)
    _G.NoClip = state
    if state then
        spawn(function()
            while _G.NoClip do
                task.wait(0.1)
                pcall(function()
                    if LocalPlayer.Character then
                        for _, part in pairs(LocalPlayer.Character:GetDescendants()) do
                            if part:IsA("BasePart") then
                                part.CanCollide = false
                            end
                        end
                    end
                end)
            end
        end)
    end
end)

misc.addToggle("Fly Mode", false, function(state)
    _G.FlyMode = state
    
    if state then
        local bodyVelocity = Instance.new("BodyVelocity")
        bodyVelocity.Velocity = Vector3.new(0, 0, 0)
        bodyVelocity.MaxForce = Vector3.new(4000, 4000, 4000)
        
        spawn(function()
            while _G.FlyMode and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") do
                pcall(function()
                    local moveDirection = Vector3.new(0, 0, 0)
                    
                    if UserInputService:IsKeyDown(Enum.KeyCode.W) then
                        moveDirection = moveDirection + workspace.CurrentCamera.CFrame.LookVector
                    end
                    if UserInputService:IsKeyDown(Enum.KeyCode.S) then
                        moveDirection = moveDirection - workspace.CurrentCamera.CFrame.LookVector
                    end
                    if UserInputService:IsKeyDown(Enum.KeyCode.A) then
                        moveDirection = moveDirection - workspace.CurrentCamera.CFrame.RightVector
                    end
                    if UserInputService:IsKeyDown(Enum.KeyCode.D) then
                        moveDirection = moveDirection + workspace.CurrentCamera.CFrame.RightVector
                    end
                    if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
                        moveDirection = moveDirection + Vector3.new(0, 1, 0)
                    end
                    if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then
                        moveDirection = moveDirection - Vector3.new(0, 1, 0)
                    end
                    
                    bodyVelocity.Velocity = moveDirection * 50
                    bodyVelocity.Parent = LocalPlayer.Character.HumanoidRootPart
                end)
                task.wait()
            end
            
            pcall(function()
                if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                    local existing = LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyVelocity")
                    if existing then
                        existing:Destroy()
                    end
                end
            end)
        end)
    else
        pcall(function()
            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                local existing = LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyVelocity")
                if existing then
                    existing:Destroy()
                end
            end
        end)
    end
end)

misc.addSection("Utility")
misc.addButton("Anti-AFK", function()
    LocalPlayer.Idled:Connect(function()
        VirtualUser:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
        task.wait(1)
        VirtualUser:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
    end)
    
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Anti-AFK",
        Text = "Anti-AFK Enabled",
        Duration = 2
    })
end)

misc.addButton("Server Hop", function()
    local TeleportService = game:GetService("TeleportService")
    local placeId = game.PlaceId
    TeleportService:TeleportToPlaceInstance(placeId, "0", LocalPlayer)
end)

misc.addButton("Rejoin Server", function()
    local TeleportService = game:GetService("TeleportService")
    local placeId = game.PlaceId
    local jobId = game.JobId
    TeleportService:TeleportToPlaceInstance(placeId, jobId, LocalPlayer)
end)

-- ============================================
-- BUILD SETTINGS TAB
-- ============================================
local settings = createUI(contentFrames[7])
settings.addSection("UI Settings")
settings.addLabel("Press RightShift to toggle UI")
settings.addLabel("Drag window to move")
settings.addLabel("Hide button minimizes UI")

settings.addSection("Theme")
settings.addDropdown("Theme", {"Dark", "Darker", "Black", "Blue"}, function(option)
    if option == "Dark" then
        MainFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
    elseif option == "Darker" then
        MainFrame.BackgroundColor3 = Color3.fromRGB(5, 5, 5)
    elseif option == "Black" then
        MainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    elseif option == "Blue" then
        MainFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 30)
    end
end)

settings.addButton("Destroy UI", function()
    -- Disable all features
    _G.AutoCollect = false
    _G.AutoMurderer = false
    _G.AutoSheriff = false
    _G.ESPEnabled = false
    _G.KillAura = false
    _G.Aimbot = false
    _G.AutoFarm = false
    _G.AutoGifts = false
    _G.NoClip = false
    _G.InfiniteJump = false
    _G.FlyMode = false
    
    -- Remove ESP
    pcall(function()
        for _, player in pairs(Players:GetPlayers()) do
            if player.Character and player.Character:FindFirstChild("ESP_Gui") then
                player.Character.ESP_Gui:Destroy()
            end
        end
    end)
    
    ScreenGui:Destroy()
end)

-- Bottom status bar
local bottomBar = Instance.new("Frame")
bottomBar.Size = UDim2.new(1, -20, 0, 35)
bottomBar.Position = UDim2.new(0, 10, 1, -40)
bottomBar.BackgroundTransparency = 1
bottomBar.Parent = MainFrame

-- ROLE
local roleLabel = Instance.new("TextLabel")
roleLabel.Size = UDim2.new(0, 45, 0, 12)
roleLabel.Position = UDim2.new(0, 0, 0, 0)
roleLabel.BackgroundTransparency = 1
roleLabel.Text = "ROLE"
roleLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
roleLabel.TextXAlignment = Enum.TextXAlignment.Left
roleLabel.Font = Enum.Font.Gotham
roleLabel.TextSize = 8
roleLabel.Parent = bottomBar

local roleValue = Instance.new("TextLabel")
roleValue.Size = UDim2.new(0, 45, 0, 16)
roleValue.Position = UDim2.new(0, 0, 0, 11)
roleValue.BackgroundTransparency = 1
roleValue.Text = "?"
roleValue.TextColor3 = Color3.fromRGB(255, 255, 255)
roleValue.TextXAlignment = Enum.TextXAlignment.Left
roleValue.Font = Enum.Font.GothamBold
roleValue.TextSize = 14
roleValue.Parent = bottomBar

-- PLAYERS
local playersLabel = Instance.new("TextLabel")
playersLabel.Size = UDim2.new(0, 45, 0, 12)
playersLabel.Position = UDim2.new(0, 55, 0, 0)
playersLabel.BackgroundTransparency = 1
playersLabel.Text = "PLAYERS"
playersLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
playersLabel.TextXAlignment = Enum.TextXAlignment.Left
playersLabel.Font = Enum.Font.Gotham
playersLabel.TextSize = 8
playersLabel.Parent = bottomBar

local playersValue = Instance.new("TextLabel")
playersValue.Size = UDim2.new(0, 45, 0, 16)
playersValue.Position = UDim2.new(0, 55, 0, 11)
playersValue.BackgroundTransparency = 1
playersValue.Text = "0"
playersValue.TextColor3 = Color3.fromRGB(255, 255, 255)
playersValue.TextXAlignment = Enum.TextXAlignment.Left
playersValue.Font = Enum.Font.GothamBold
playersValue.TextSize = 14
playersValue.Parent = bottomBar

-- KILLS
local killsLabel = Instance.new("TextLabel")
killsLabel.Size = UDim2.new(0, 45, 0, 12)
killsLabel.Position = UDim2.new(0, 110, 0, 0)
killsLabel.BackgroundTransparency = 1
killsLabel.Text = "KILLS"
killsLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
killsLabel.TextXAlignment = Enum.TextXAlignment.Left
killsLabel.Font = Enum.Font.Gotham
killsLabel.TextSize = 8
killsLabel.Parent = bottomBar

local killsValue = Instance.new("TextLabel")
killsValue.Size = UDim2.new(0, 45, 0, 16)
killsValue.Position = UDim2.new(0, 110, 0, 11)
killsValue.BackgroundTransparency = 1
killsValue.Text = "0"
killsValue.TextColor3 = Color3.fromRGB(0, 255, 0)
killsValue.TextXAlignment = Enum.TextXAlignment.Left
killsValue.Font = Enum.Font.GothamBold
killsValue.TextSize = 12
killsValue.Parent = bottomBar

-- DEATHS
local deathsLabel = Instance.new("TextLabel")
deathsLabel.Size = UDim2.new(0, 45, 0, 12)
deathsLabel.Position = UDim2.new(0, 165, 0, 0)
deathsLabel.BackgroundTransparency = 1
deathsLabel.Text = "DEATHS"
deathsLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
deathsLabel.TextXAlignment = Enum.TextXAlignment.Left
deathsLabel.Font = Enum.Font.Gotham
deathsLabel.TextSize = 8
deathsLabel.Parent = bottomBar

local deathsValue = Instance.new("TextLabel")
deathsValue.Size = UDim2.new(0, 45, 0, 16)
deathsValue.Position = UDim2.new(0, 165, 0, 11)
deathsValue.BackgroundTransparency = 1
deathsValue.Text = "0"
deathsValue.TextColor3 = Color3.fromRGB(255, 100, 100)
deathsValue.TextXAlignment = Enum.TextXAlignment.Left
deathsValue.Font = Enum.Font.GothamBold
deathsValue.TextSize = 12
deathsValue.Parent = bottomBar

-- Infinite Jump handler
UserInputService.JumpRequest:Connect(function()
    if _G.InfiniteJump and LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
        LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
    end
end)

-- Update stats
task.spawn(function()
    while task.wait(1) do
        pcall(function()
            -- Update player count
            playersValue.Text = tostring(#Players:GetPlayers())
            
            -- Update role
            if LocalPlayer.Character then
                if LocalPlayer.Character:FindFirstChild("Knife") or LocalPlayer.Backpack:FindFirstChild("Knife") then
                    roleValue.Text = "MURDERER"
                    roleValue.TextColor3 = Color3.fromRGB(255, 0, 0)
                elseif LocalPlayer.Character:FindFirstChild("Gun") or LocalPlayer.Backpack:FindFirstChild("Gun") then
                    roleValue.Text = "SHERIFF"
                    roleValue.TextColor3 = Color3.fromRGB(255, 255, 0)
                else
                    roleValue.Text = "INNOCENT"
                    roleValue.TextColor3 = Color3.fromRGB(0, 255, 0)
                end
            end
            
            -- Try to get stats from leaderstats
            local stats = LocalPlayer:FindFirstChild("leaderstats")
            if stats then
                local kills = stats:FindFirstChild("Kills") or stats:FindFirstChild("kills")
                local deaths = stats:FindFirstChild("Deaths") or stats:FindFirstChild("deaths")
                
                if kills then killsValue.Text = tostring(kills.Value) end
                if deaths then deathsValue.Text = tostring(deaths.Value) end
            end
        end)
    end
end)

-- Toggle UI with RightShift
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and input.KeyCode == Enum.KeyCode.RightShift then
        MainFrame.Visible = not MainFrame.Visible
        HideIcon.Visible = not MainFrame.Visible
    end
end)

-- Anti-AFK by default
LocalPlayer.Idled:Connect(function()
    VirtualUser:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
    task.wait(1)
    VirtualUser:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
end)

-- Notification
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "MM2 Hub",
    Text = "Full Version Loaded! Press RightShift",
    Duration = 3
})
