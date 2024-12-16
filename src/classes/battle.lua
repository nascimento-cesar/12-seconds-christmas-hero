Battle = {
  new = function(level)
    local obj = {
      hero = nil,
      enemies = {},
      level = level
    }

    obj.defeat = function()
      obj.finish()
    end

    obj.draw = function()
      print("battle", 62, 32, 7)

      for enemy in all(obj.enemies) do
        enemy.draw()
      end

      obj.hero.draw()
    end

    obj.finish = function()
      player.level_up()
      game.current_mode = Overworld.new()
    end

    obj.setup = function()
      obj.hero = Challenger.new(100, player.level, player.level * 10, 2, player.battle_sprites)

      for i = 1, 1 do
        add(obj.enemies, Challenger.new(100, obj.level, obj.level * 10, 1, { 0, 1 }, true))
      end
    end

    obj.update = function()
      obj.hero.move()

      for enemy in all(obj.enemies) do
        enemy.move()

        local power_ratio = obj.hero.power / enemy.power

        if obj.hero.x + 4 >= enemy.x then
          enemy.damage(obj.hero.power)
          obj.hero.damage(enemy.power)

          if enemy.is_defeated then
            del(obj.enemies, enemy)
          else
            if power_ratio > 1 then
              enemy.move(min(power_ratio * game.dmg_bias, game.dmg_cap), true)
            elseif power_ratio < 1 then
              obj.hero.move(min(game.dmg_bias / power_ratio, game.dmg_cap), true)
            else
              obj.hero.move(game.dmg_bias, true)
              enemy.move(game.dmg_bias, true)
            end
          end
        end
      end

      if obj.hero.x > 128 or #obj.enemies == 0 then
        obj.victory()
      elseif obj.hero.x < 0 or obj.hero.is_defeated then
        obj.defeat()
      end
    end

    obj.victory = function()
      obj.finish()
    end

    return obj
  end
}