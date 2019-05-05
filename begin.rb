class Begin
  def initialize
    player = User.new
    dealer = User.new
    game = Game.new(player, dealer)
    Interface.new(game)
  end
end
