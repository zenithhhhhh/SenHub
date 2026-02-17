-- Create a completely standalone GUI that matches the pictures exactly
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "icHub"
ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- Main frame - PERFECT SQUARE (300x300)
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 300, 0, 300) -- Perfect square
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
Title.Text = "icHub [ Solo Hunters ]"
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
DiscordText.Text = "discord.gg/mbyHbXAhhT"
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
IconText.Text = "ic"
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

-- Create tab buttons (smaller to fit in square)
local tabs = {"About", "Farm", "Lobby", "Quest", "Player", "Travel", "Settings"}
local tabButtons = {}
local contentFrames = {}

for i, tabName in ipairs(tabs) do
    local tabBtn = Instance.new("TextButton")
    tabBtn.Size = UDim2.new(0, 36, 1, 0)
    tabBtn.Position = UDim2.new(0, (i-1) * 38, 0, 0)
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

-- Function to create UI elements (ultra compact for square)
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
        dropdownBtn.Size = UDim2.new(0, 90, 0, 20)
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
    
    return {
        addSection = addSection,
        addToggle = addToggle,
        addDropdown = addDropdown,
        addButton = addButton,
        addLabel = addLabel
    }
end

-- Build About tab
local about = createUI(contentFrames[1])
about.addLabel("Sen Hub")
about.addLabel("Thanks for using!")
about.addLabel("Join discord for help")

-- Build Farm tab
local farm = createUI(contentFrames[2])
farm.addSection("Farm")
farm.addToggle("Auto Farm", false)
farm.addToggle("Auto Start", false)
farm.addToggle("Auto Leave", false)
farm.addToggle("Auto Collect", false)

-- Build Lobby tab
local lobby = createUI(contentFrames[3])
lobby.addSection("Dungeon")
lobby.addDropdown("Dungeon", {"Subway", "Caves", "Jungle"})
lobby.addDropdown("Rank", {"F", "E", "D"})
lobby.addToggle("Auto Join", false)

-- Build Quest tab
local quest = createUI(contentFrames[4])
quest.addSection("Quest")
quest.addDropdown("Quest", {"Subway", "Caves"})
quest.addToggle("Auto Accept", false)

-- Build Player tab
local player = createUI(contentFrames[5])
player.addSection("Stats")
player.addDropdown("Stat", {"Str", "Agi", "Int"})
player.addToggle("Auto Stat", false)

-- Build Travel tab
local travel = createUI(contentFrames[6])
travel.addSection("NPC")
travel.addDropdown("NPC", {"Hunter Tim", "Rubble Doug"})
travel.addButton("Teleport", function() end)

-- Build Settings tab
local settings = createUI(contentFrames[7])
settings.addSection("UI")
settings.addToggle("Anti-Afk", false)
settings.addLabel("RightShift to toggle")

-- Bottom status bar (compact)
local bottomBar = Instance.new("Frame")
bottomBar.Size = UDim2.new(1, -20, 0, 35)
bottomBar.Position = UDim2.new(0, 10, 1, -40)
bottomBar.BackgroundTransparency = 1
bottomBar.Parent = MainFrame

-- POWER
local powerLabel = Instance.new("TextLabel")
powerLabel.Size = UDim2.new(0, 45, 0, 12)
powerLabel.Position = UDim2.new(0, 0, 0, 0)
powerLabel.BackgroundTransparency = 1
powerLabel.Text = "POWER"
powerLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
powerLabel.TextXAlignment = Enum.TextXAlignment.Left
powerLabel.Font = Enum.Font.Gotham
powerLabel.TextSize = 8
powerLabel.Parent = bottomBar

local powerValue = Instance.new("TextLabel")
powerValue.Size = UDim2.new(0, 45, 0, 16)
powerValue.Position = UDim2.new(0, 0, 0, 11)
powerValue.BackgroundTransparency = 1
powerValue.Text = "21"
powerValue.TextColor3 = Color3.fromRGB(255, 255, 255)
powerValue.TextXAlignment = Enum.TextXAlignment.Left
powerValue.Font = Enum.Font.GothamBold
powerValue.TextSize = 14
powerValue.Parent = bottomBar

-- LEVEL
local levelLabel = Instance.new("TextLabel")
levelLabel.Size = UDim2.new(0, 45, 0, 12)
levelLabel.Position = UDim2.new(0, 55, 0, 0)
levelLabel.BackgroundTransparency = 1
levelLabel.Text = "LEVEL"
levelLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
levelLabel.TextXAlignment = Enum.TextXAlignment.Left
levelLabel.Font = Enum.Font.Gotham
levelLabel.TextSize = 8
levelLabel.Parent = bottomBar

local levelValue = Instance.new("TextLabel")
levelValue.Size = UDim2.new(0, 45, 0, 16)
levelValue.Position = UDim2.new(0, 55, 0, 11)
levelValue.BackgroundTransparency = 1
levelValue.Text = "7"
levelValue.TextColor3 = Color3.fromRGB(255, 255, 255)
levelValue.TextXAlignment = Enum.TextXAlignment.Left
levelValue.Font = Enum.Font.GothamBold
levelValue.TextSize = 14
levelValue.Parent = bottomBar

-- HEAL
local healthLabel = Instance.new("TextLabel")
healthLabel.Size = UDim2.new(0, 45, 0, 12)
healthLabel.Position = UDim2.new(0, 110, 0, 0)
healthLabel.BackgroundTransparency = 1
healthLabel.Text = "HEAL"
healthLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
healthLabel.TextXAlignment = Enum.TextXAlignment.Left
healthLabel.Font = Enum.Font.Gotham
healthLabel.TextSize = 8
healthLabel.Parent = bottomBar

local healthValue = Instance.new("TextLabel")
healthValue.Size = UDim2.new(0, 45, 0, 16)
healthValue.Position = UDim2.new(0, 110, 0, 11)
healthValue.BackgroundTransparency = 1
healthValue.Text = "114"
healthValue.TextColor3 = Color3.fromRGB(0, 255, 0)
healthValue.TextXAlignment = Enum.TextXAlignment.Left
healthValue.Font = Enum.Font.GothamBold
healthValue.TextSize = 12
healthValue.Parent = bottomBar

-- ENER
local energyLabel = Instance.new("TextLabel")
energyLabel.Size = UDim2.new(0, 45, 0, 12)
energyLabel.Position = UDim2.new(0, 165, 0, 0)
energyLabel.BackgroundTransparency = 1
energyLabel.Text = "ENER"
energyLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
energyLabel.TextXAlignment = Enum.TextXAlignment.Left
energyLabel.Font = Enum.Font.Gotham
energyLabel.TextSize = 8
energyLabel.Parent = bottomBar

local energyValue = Instance.new("TextLabel")
energyValue.Size = UDim2.new(0, 45, 0, 16)
energyValue.Position = UDim2.new(0, 165, 0, 11)
energyValue.BackgroundTransparency = 1
energyValue.Text = "100"
energyValue.TextColor3 = Color3.fromRGB(0, 100, 255)
energyValue.TextXAlignment = Enum.TextXAlignment.Left
energyValue.Font = Enum.Font.GothamBold
energyValue.TextSize = 12
energyValue.Parent = bottomBar

-- Services for updating stats
local Players = game:GetService("Players")
local Player = Players.LocalPlayer

-- Update stats
task.spawn(function()
    while task.wait(1) do
        local character = Player.Character
        if character then
            local humanoid = character:FindFirstChild("Humanoid")
            local stats = Player:FindFirstChild("leaderstats")
            
            if stats then
                local power = stats:FindFirstChild("Power")
                local level = stats:FindFirstChild("Level")
                
                if power then powerValue.Text = tostring(power.Value) end
                if level then levelValue.Text = tostring(level.Value) end
            end
            
            if humanoid then
                healthValue.Text = math.floor(humanoid.Health)
            end
        end
    end
end)

-- Anti-AFK
local VirtualUser = game:GetService("VirtualUser")
Player.Idled:Connect(function()
    VirtualUser:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
    task.wait(1)
    VirtualUser:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
end)

-- Toggle UI with RightShift
local UserInputService = game:GetService("UserInputService")
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and input.KeyCode == Enum.KeyCode.RightShift then
        MainFrame.Visible = not MainFrame.Visible
        HideIcon.Visible = not MainFrame.Visible
    end
end)

-- Notification
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "icHub",
    Text = "Loaded! Press RightShift",
    Duration = 3
})
