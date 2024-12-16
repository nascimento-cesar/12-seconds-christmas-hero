Game = {
  new = function()
    local obj = {
      current_mode = nil,
      dmg_bias = 5,
      dmg_cap = 64
    }

    obj.draw = function()
      countdown.draw()

      if obj.current_mode then
        obj.current_mode.draw()
      end
    end

    obj.set_battle = function(level)
      local battle = Battle.new(level)
      battle.setup()
      game.current_mode = battle
    end

    obj.set_overworld = function()
      game.current_mode = Overworld.new()
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