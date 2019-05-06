class User
  attr_accessor :cards

  def initialize
    @cards = []
  end

  def value
    @cards.reduce(0) do |memo, card|
      memo + if card.rank != 'A'
               card.value
             else
               memo <= 10 ? 11 : 1
             end
    end
  end
end
