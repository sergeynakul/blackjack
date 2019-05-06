class Card
  attr_reader :rank, :suit

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def value
    return @rank if @rank.is_a?(Integer)
    return 10 if @rank.is_a?(String)
  end
end
