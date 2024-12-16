Countdown = {}

function Countdown:new()
  local obj = {}

  obj.default_t = 12.0
  obj.is_frozen = false
  obj.t = 12.0
  obj.t0 = time()

  obj.draw = function()
    local truncated_time = get_truncated_time(obj.t)
    print(truncated_time, 0, 0, 7)
  end

  obj.update = function()
    if not obj.is_frozen then
      obj.t = obj.default_t - (time() - obj.t0)
    end
  end

  return obj
end