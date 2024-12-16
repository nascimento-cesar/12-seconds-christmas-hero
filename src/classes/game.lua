Game = {
  new = function()
    local obj = {
      current_mode = nil
    }

    obj.draw = function()
      countdown.draw()

      if obj.current_mode then
        obj.current_mode.draw()
      end
    end

    obj.update = function()
      countdown.update()

      if obj.current_mode then
        obj.current_mode.update()
      end
    end

    return obj
  end
}