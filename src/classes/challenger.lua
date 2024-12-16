Challenger = {
  new = function(hp, level, power, speed, sprites, is_enemy)
    local obj = {
      hp = hp,
      is_defeated = false,
      is_enemy = is_enemy,
      level = level,
      power = power,
      speed = speed,
      sprites = sprites,
      x = is_enemy and 127 or 0,
      y = 62
    }

    obj.damage = function(dmg)
      obj.hp -= dmg
      obj.is_defeated = obj.hp <= 0 or false
    end

    obj.draw = function()
      spr(obj.sprites[sin(time() / 0.5) > 0 and 1 or 2], obj.x, obj.y, 1, 1, obj.is_enemy)
    end

    obj.move = function(x, backwards)
      obj.x += ((x or obj.speed) * (obj.is_enemy and -1 or 1)) * (backwards and -1 or 1)
    end

    return obj
  end
}