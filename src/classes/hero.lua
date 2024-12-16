Hero = {
  new = function()
    local obj = {
      hp = 100,
      is_defeated = false,
      level = 1,
      power = 1,
      speed = 1,
      x = 0,
      y = 62
    }

    obj.draw = function()
      pset(obj.x, obj.y, 3)
    end

    obj.move = function(x)
      obj.x += x or obj.speed
    end

    obj.damage = function(dmg)
      obj.hp -= dmg
      obj.is_defeated = obj.hp <= 0 or false
    end

    obj.reset_position = function()
      obj.x = 0
      obj.y = 62
    end

    obj.level_up = function()
      obj.level += 1
      obj.power *= obj.level
    end

    return obj
  end
}