Game = {
  new = function()
    local obj = {
      current_mode = nil
    }

    obj.draw = function()
      countdown.draw()
      hero.draw(1)
    end

    obj.update = function()
      countdown.update()
      hero.move(1)
    end

    return obj
  end
}