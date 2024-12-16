Player = {
  new = function()
    local obj = {
      battle_sprites = { 0, 1 },
      level = 1
    }

    obj.level_up = function()
      obj.level += 1
    end

    return obj
  end
}