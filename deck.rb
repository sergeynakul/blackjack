class Deck
  attr_accessor :cards

  RANKS = [*(2..10), 'J', 'Q', 'K', 'A'].freeze
  SUITS = ['♣', '♥', '♠', '♦'].freeze

  def initialize
    @cards = []

    RANKS.each do |rank|
      SUITS.each do |suit|
        @cards << Card.new(rank, suit)
      end
    end

    @cards.shuffle!
  end
end
