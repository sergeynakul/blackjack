class Card
  attr_reader :rank

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def display_card
    puts "#{@rank}#{@suit}"
  end
end
