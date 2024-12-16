Overworld = {
  new = function()
    local obj = {}

    obj.draw = function()
      print("overworld", 62, 32, 7)
    end

    obj.update = function()
      if btnp(🅾️) then
        game.set_battle(1)
      end
    end

    return obj
  end
}