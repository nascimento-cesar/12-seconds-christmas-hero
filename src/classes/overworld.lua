Overworld = {
  new = function()
    local obj = {}

    obj.draw = function()
      print("overworld", 62, 32, 7)
      hero.draw()
    end

    obj.update = function()
      hero.move(1)
    end

    return obj
  end
}