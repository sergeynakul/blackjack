class Game
  attr_reader :player, :dealer

  def initialize(player, dealer)
    @player = player
    @dealer = dealer
    @player_bank = 100
    @dealer_bank = 100
    @deck = Deck.new
  end
end
