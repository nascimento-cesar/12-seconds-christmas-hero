Enemy = {
  new = function(x, y, level)
    local obj = {
      hp = level * 10,
      is_defeated = false,
      level = level,
      power = level,
      speed = level,
      x = x,
      y = y
    }

    obj.damage = function(d)
      obj.hp -= d
      obj.is_defeated = obj.hp <= 0 or false
    end

    obj.draw = function()
      pset(obj.x, obj.y, 2)
    end

    obj.move = function(x)
      obj.x -= x or obj.speed
    end

    return obj
  end
}