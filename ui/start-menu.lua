local love = require "love"

local StartMenu = {}

local titleFont, buttonFont
local buttons = {}

function StartMenu.load()
  titleFont = love.graphics.newFont("assets/Minecraft.ttf", 72)
  buttonFont = love.graphics.newFont("assets/Minecraft.ttf", 32)

  local width, height = love.graphics.getDimensions()
  local baseWidth, baseHeight = 300, 70

  buttons = {
    {label = "Start", x = (width - baseWidth) / 2, y = height * 0.50, width = baseWidth, height = baseHeight},
    {label = "Exit", x = (width - baseWidth) / 2, y = height * 0.50 + baseHeight + 30, width = baseWidth, height = baseHeight},
  }
end

function StartMenu.draw()
  local width, height = love.graphics.getDimensions()

  love.graphics.clear(1, 0.55, 0.1)

  love.graphics.setFont(titleFont)
  love.graphics.setColor(1, 1, 1)
  love.graphics.printf("Run the Invasion!", 0, height * 0.18, width, "center")

  love.graphics.setFont(buttonFont)
  for _, button in ipairs(buttons) do
    love.graphics.setColor(0.2, 0.1, 0.05)
    love.graphics.rectangle("fill", button.x, button.y, button.width, button.height)

    love.graphics.setColor(1, 1, 1)
    local textY = button.y + (button.height - buttonFont:getHeight()) / 2
    love.graphics.printf(button.label, button.x, textY, button.width, "center")
  end

  love.graphics.setColor(1, 1, 1)
end

return StartMenu
