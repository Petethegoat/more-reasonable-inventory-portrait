local defaultConfig = {
    maxHeight = 480
}
local configPath = "More Reasonable Inventory Portrait"
local myConfig = mwse.loadConfig(configPath, defaultConfig)


--- @param e uiActivatedEventData
local function uiActivatedCallback(e)
    e.element:findChild("MenuInventory_character_layout").maxHeight = myConfig.maxHeight
end
event.register(tes3.event.uiActivated, uiActivatedCallback, { filter = "MenuInventory" })


local function registerModConfig()
    local template = mwse.mcm.createTemplate({
        name = configPath,
        config = myConfig
    })

    template:register()
    template:saveOnClose(configPath, myConfig)
    local page = template:createPage({ label = "Settings" })

    page:createInfo({
        label = configPath,
        text = "Version 1.0.0\nCreated by Pete Goodfellow\non 27 Dec 2024"
    })

    page:createSlider({
        label = "Max Height",
        configKey = "maxHeight",
        min = 120,
        max = 800,
        step = 10,
        jump = 10,
        text = "Restart the game or load a save to see the effect.",
    })
end
event.register(tes3.event.modConfigReady, registerModConfig)