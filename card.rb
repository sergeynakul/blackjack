class Card
  attr_reader :rank, :suit

  RANKS = [*(2..10), 'J', 'Q', 'K', 'A'].freeze
  SUITS = ['♣', '♥', '♠', '♦'].freeze

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def value
    return @rank if @rank.is_a?(Integer)
    return 10 if @rank.is_a?(String)
  end

  def not_ace?
    @rank != 'A'
  end
end
