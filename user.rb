class User
  attr_accessor :cards

  def initialize
    @cards = []
  end

  def show
    @cards.each(&:display_card)
  end

  def show_hidden
    @cards.count { puts '*' }
  end

  def value
    total = 0
    @cards.each do |card|
      total += if card.rank.is_a?(Integer)
                 card.rank
               elsif card.rank.is_a?(String) && card.rank != 'A'
                 10
               else
                 total <= 10 ? 11 : 1
               end
    end
    total
  end
end
