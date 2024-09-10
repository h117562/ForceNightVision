
local function GetKeyFromConfig(config)
    local key = GetModConfigData(config)
    return key and (type(key) == "number" and key or GLOBAL[key])
end

---@type number
local TOGGLE_KEY = GetKeyFromConfig("TOGGLE_KEY")

local nightvision_active = false

local function InGame()
    return GLOBAL.ThePlayer and GLOBAL.ThePlayer.HUD and not GLOBAL.ThePlayer.HUD:HasInputFocus()
end

local function ToggleNightVision()
    nightvision_active = not nightvision_active
    GLOBAL.ThePlayer.components.playervision:ForceNightVision(nightvision_active)
end

GLOBAL.TheInput:AddKeyUpHandler(TOGGLE_KEY, function ()
    if not InGame() then return end
    ToggleNightVision()
end)
