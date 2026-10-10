local SceneManager = {}

local scenes = {}
local current

function SceneManager.register(name, scene)
  scenes[name] = scene
end

function SceneManager.switch(name)
  assert(scenes[name], "No scene registered with name: " .. tostring(name))

  if current and current.leave then
    current.leave()
  end

  current = scenes[name]

  if current.enter then
    current.enter()
  end
end

function SceneManager.update(dt)
  if current and current.update then
    current.update(dt)
  end
end

function SceneManager.draw()
  if current and current.draw then
    current.draw()
  end
end

function SceneManager.mousepressed(x, y, button)
  if current and current.mousepressed then
    current.mousepressed(x, y, button)
  end
end

function SceneManager.keypressed(key)
  if current and current.keypressed then
    current.keypressed(key)
  end
end

return SceneManager
