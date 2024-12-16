function _init()
  countdown = Countdown.new()
  game = Game.new()
  hero = Hero.new()

  game.current_mode = Overworld.new()
end