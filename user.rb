class User
  attr_accessor :cards

  def initialize
    @cards = []
  end

  def value
    total = 0
    @cards.each do |card|
      total += if card.rank != 'A'
                 card.value
               else
                 total <= 10 ? 11 : 1
               end
    end
    total
  end
end
