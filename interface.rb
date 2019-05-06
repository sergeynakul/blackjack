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
      @game.dealer_go
      open_cards if @game.end_round?
      menu
    when '2'
      @game.player_go
      open_cards if @game.end_round?
      @game.dealer_go
      open_cards if @game.end_round?
      menu
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
