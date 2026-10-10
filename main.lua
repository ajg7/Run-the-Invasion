local love = require "love"

local StartMenu = require "ui.start-menu"

function love.load()
  StartMenu.load()
end

function love.update(dt)
  StartMenu.update(dt)
end

function love.draw()
  StartMenu.draw()
end
