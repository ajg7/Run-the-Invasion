local love = require "love"

local SceneManager = require "scene-manager"
local StartMenu = require "ui.start-menu"
local Track = require "ui.track"
local GameOverMenu = require "ui.game-over-menu"

function love.load()
  StartMenu.load()
  Track.load()
  GameOverMenu.load()

  SceneManager.register("menu", StartMenu)
  SceneManager.register("game", Track)
  SceneManager.register("gameover", GameOverMenu)

  SceneManager.switch("menu")
end

function love.update(dt)
  SceneManager.update(dt)
end

function love.draw()
  SceneManager.draw()
end

function love.mousepressed(x, y, button)
  SceneManager.mousepressed(x, y, button)
end

function love.keypressed(key)
  SceneManager.keypressed(key)
end
