Battle = {
  new = function(level)
    local obj = {
      enemies = {},
      level = level
    }

    obj.defeat = function()
      obj.finish()
    end

    obj.draw = function()
      print("battle", 62, 32, 7)
      hero.draw()

      for enemy in all(obj.enemies) do
        enemy.draw()
      end
    end

    obj.finish = function()
      hero.reset_position()
      hero.level_up()
      game.current_mode = Overworld.new()
    end

    obj.setup = function()
      for i = 1, 1 do
        add(obj.enemies, Enemy.new(127, 62, 1))
      end
    end

    obj.update = function()
      hero.move(1)

      for enemy in all(obj.enemies) do
        enemy.move()

        local power_ratio = hero.power / enemy.power

        if hero.x >= enemy.x then
          enemy.damage(hero.power)
          hero.damage(enemy.power)

          if enemy.is_defeated then
            del(obj.enemies, enemy)
          else
            if power_ratio > 1 then
              enemy.move(min(power_ratio * game.dmg_bias, game.dmg_cap) * -1)
            elseif power_ratio < 1 then
              hero.move(min(game.dmg_bias / power_ratio, game.dmg_cap) * -1)
            else
              hero.move(game.dmg_bias * -2)
              enemy.move(game.dmg_bias * -2)
            end
          end
        end
      end

      if hero.x > 128 or #obj.enemies == 0 then
        obj.victory()
      elseif hero.x < 0 or hero.is_defeated then
        obj.defeat()
      end
    end

    obj.victory = function()
      obj.finish()
    end

    return obj
  end
}