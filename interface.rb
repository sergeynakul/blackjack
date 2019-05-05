class Interface
  attr_reader :game

  def initialize(game)
    @game = game
    start
    run
  end

  def start
    puts 'Привет, как тебя зовут?'
    @player_name = gets.chomp.capitalize!
    puts "Хорошо #{@player_name}, поехали"
  end

  def run
    system 'clear'
    @game.round
    menu
  end

  def menu
    info
    show_card_game
    puts "Сумма твоих очков - #{@game.player.value}"
    puts 'Сделай выбор'
    puts '1. Пропустить ход'
    puts '2. Добавить карту'
    puts '3. Открыть карты'

    choice = gets.chomp
    case choice
    when '1'
      dealer_go
    when '2'
      @game.player.cards << @game.deck.cards.shift if @game.player.cards.count == Game::TWO_CARDS
      open_cards if three_cards?
      dealer_go
    when '3'
      open_cards
    end
  end

  def info
    puts "У тебя: #{@game.player_bank} $"
    puts "У диллера: #{@game.dealer_bank} $"
  end

  def show_card_game
    puts 'Твои карты'
    @game.player.cards.each { |card| puts "#{card.rank}#{card.suit}" }
    puts 'Карты диллера'
    @game.dealer.cards.count { puts '*' }
  end

  def three_cards?
    @game.player.cards.count == Game::THREE_CARDS && @game.dealer.cards.count == Game::THREE_CARDS
  end

  def dealer_go
    @game.dealer.cards << @game.deck.cards.shift if @game.dealer.value < Game::ENOUGH && @game.dealer.cards.count == Game::TWO_CARDS
    open_cards if three_cards?
    menu
  end

  def open_cards
    puts 'Твои карты'
    @game.player.cards.each { |card| puts "#{card.rank}#{card.suit}" }
    puts 'Карты Диллера'
    @game.dealer.cards.each { |card| puts "#{card.rank}#{card.suit}" }
    puts "Сумма очков: твои - #{@game.player.value}, диллера - #{@game.dealer.value}"
    who_win?
  end

  def who_win?
    if @game.draw?
      puts 'Ничья'
    elsif @game.player_win?
      puts 'Ты победитель'
    elsif @game.dealer_win?
      puts 'Диллер выйграл'
    end
    continue
  end

  def continue
    puts 'Для продолжения введите - 1, для выхода - любой символ'
    if gets.chomp == '1'
      run
    else
      exit
    end
  end
end
