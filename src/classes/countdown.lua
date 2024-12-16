Countdown = {
  new = function()
    local obj = {
      default_t = 12.0,
      is_frozen = false,
      t = 12.0,
      t0 = time()
    }

    obj.draw = function()
      print(get_truncated_time(obj.t), 0, 0, 7)
    end

    obj.update = function()
      if not obj.is_frozen then
        obj.t = obj.default_t - (time() - obj.t0)
      end
    end

    return obj
  end
}