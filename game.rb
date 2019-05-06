class Game
  attr_reader :player, :dealer, :deck, :player_bank, :dealer_bank
  attr_accessor :all_bank

  TWO_CARDS = 2
  THREE_CARDS = 3
  ENOUGH = 17

  def initialize(player, dealer)
    @player = player
    @dealer = dealer
  end

  def round
    @player_bank ||= 100
    @dealer_bank ||= 100
    check_minus
    @all_bank = 0
    @player.cards = []
    @dealer.cards = []
    @deck = Deck.new
    bet
    deal_card
  end

  def bet
    @player_bank -= 10
    @dealer_bank -= 10
    @all_bank += 20
  end

  def deal_card
    2.times { @player.cards << @deck.cards.shift }
    2.times { @dealer.cards << @deck.cards.shift }
  end

  def draw?
    draw_bank if (@player.value == @dealer.value) || (@player.value > 21 && @dealer.value > 21)
  end

  def draw_bank
    @player_bank += @all_bank / 2
    @dealer_bank += @all_bank / 2
  end

  def player_win?
    player_win if (@player.value <= 21 && @player.value > @dealer.value) || (@player.value <= 21 && @dealer.value > 21)
  end

  def player_win
    @player_bank += @all_bank
  end

  def dealer_win?
    dealer_win if (@dealer.value <= 21 && @dealer.value > @player.value) || (@dealer.value <= 21 && @player.value > 21)
  end

  def dealer_win
    @dealer_bank += @all_bank
  end

  def check_minus
    @player_bank = 100 if @player_bank <= 0
    @dealer_bank = 100 if @dealer_bank <= 0
  end

  def dealer_go
    @dealer.cards << @deck.cards.shift if @dealer.value < ENOUGH && @dealer.cards.count == TWO_CARDS
  end

  def player_go
    @player.cards << @deck.cards.shift if @player.cards.count == TWO_CARDS
  end

  def three_cards?
    @player.cards.count == THREE_CARDS && @dealer.cards.count == THREE_CARDS
  end
end
