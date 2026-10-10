local love = require "love"
local SceneManager = require "scene-manager"

local StartMenu = {}

local titleFont, buttonFont
local menuMusic
local buttons = {}

local sprites = {}
local frameSize = 36
local spriteScale = 3

local function isInside(px, py, rect)
  return px >= rect.x and px <= rect.x + rect.width
     and py >= rect.y and py <= rect.y + rect.height
end

function StartMenu.load()
  titleFont = love.graphics.newFont("assets/Minecraft.ttf", 72)
  buttonFont = love.graphics.newFont("assets/Minecraft.ttf", 32)
  menuMusic = love.audio.newSource("assets/arcade-beat.mp3", "stream")
  menuMusic:setLooping(true)

  local function makeSprite(path)
    local image = love.graphics.newImage(path)
    image:setFilter("nearest", "nearest")
    local quad = love.graphics.newQuad(0, 0, frameSize, frameSize, image:getDimensions())
    return {image = image, quad = quad}
  end

  sprites = {
    makeSprite("assets/runner_hero.png"),
    makeSprite("assets/alien.png"),
    makeSprite("assets/slammer.png"),
  }

  local width, height = love.graphics.getDimensions()
  local baseWidth, baseHeight = 300, 70

  buttons = {
    {label = "Start", x = (width - baseWidth) / 2, y = height * 0.50, width = baseWidth, height = baseHeight, action = function() SceneManager.switch("game") end},
    {label = "Exit", x = (width - baseWidth) / 2, y = height * 0.50 + baseHeight + 30, width = baseWidth, height = baseHeight, action = function() love.event.quit() end},
  }
end

function StartMenu.enter()
  menuMusic:play()
end

function StartMenu.leave()
  menuMusic:stop()
end

function StartMenu.draw()
  local width, height = love.graphics.getDimensions()

  love.graphics.clear(0.16, 0.08, 0.28)

  love.graphics.setFont(titleFont)
  love.graphics.setColor(1, 0.55, 0.1)
  love.graphics.printf("Run the Invasion!", 4, height * 0.18 + 4, width, "center")
  love.graphics.setColor(1, 1, 1)
  love.graphics.printf("Run the Invasion!", 0, height * 0.18, width, "center")

  local drawSize = frameSize * spriteScale  
  local gap = 60
  local rowWidth = #sprites * drawSize + (#sprites - 1) * gap
  local startX = (width - rowWidth) / 2
  local spriteY = height * 0.33

  love.graphics.setColor(1, 1, 1)
  for i, sprite in ipairs(sprites) do
    local x = startX + (i - 1) * (drawSize + gap)
    love.graphics.draw(sprite.image, sprite.quad, x, spriteY, 0, spriteScale, spriteScale)
  end

  love.graphics.setFont(buttonFont)
  for _, button in ipairs(buttons) do
    love.graphics.setColor(0.3, 0.16, 0.5)
    love.graphics.rectangle("fill", button.x, button.y, button.width, button.height)
    love.graphics.setColor(1, 0.55, 0.1)
    love.graphics.setLineWidth(4)
    love.graphics.rectangle("line", button.x, button.y, button.width, button.height)

    love.graphics.setColor(1, 1, 1)
    local textY = button.y + (button.height - buttonFont:getHeight()) / 2
    love.graphics.printf(button.label, button.x, textY, button.width, "center")
  end

  love.graphics.setColor(1, 1, 1)
end

return StartMenu
