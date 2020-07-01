class Player
  attr_accessor :rps_choice, :name

  def initialize(player_type)
    @player_type = player_type
    @rps_choice = nil
    set_name
  end

  def set_name
    if human?
      n = ""
      loop do
        puts "Please enter your name:"
        n = gets.chomp
        break unless n.empty?
        puts "Try again. Please enter your name:"
      end
      self.name = n
    else
      self.name = 'Acorn'
    end
  end

  def human?
    @player_type == :human
  end

  def choose
    if human?
      loop do
        puts "Do you choose rock, paper or scissors?"
        @rps_choice = gets.chomp
        break if %w(rock paper scissors).include?(@rps_choice)
        puts "Invalid choice, enter rock, paper or scissors:"
      end
    else
      @rps_choice = %w(rock paper scissors).sample
    end
  end
end

class RPSGame
  attr_accessor :human, :computer

  def initialize
    @human = Player.new(:human)
    @computer = Player.new(:computer)
  end

  def display_welcome_message
    puts "Welcome to Rock, Paper, Scissors.."
  end

  def display_goodbye_message
    puts "Thanks for playing Rock, Paper, Scissors!"
  end

  def display_winner
    puts "#{human.name} chose #{human.rps_choice}."
    puts "#{computer.name} chose #{computer.rps_choice}."

    case human.rps_choice
    when 'rock'
      puts "It's a tie" if computer.rps_choice == 'rock'
      puts "#{human.name} won" if computer.rps_choice == 'scissors'
      puts "#{computer.name} won" if computer.rps_choice == 'paper'
    when 'paper'
      puts "It's a tie" if computer.rps_choice == 'paper'
      puts "#{human.name} won" if computer.rps_choice == 'rock'
      puts "#{computer.name} won" if computer.rps_choice == 'scissors'
    when 'scissors'
      puts "It's a tie" if computer.rps_choice == 'scissors'
      puts "#{human.name} won" if computer.rps_choice == 'paper'
      puts "#{computer.name} won" if computer.rps_choice == 'rock'
    end
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? Enter yes or no:"
      answer = gets.chomp
      break if answer == 'yes' || answer == 'no'
      puts "Incorrect response, enter yes or no:"
    end

    if answer == 'yes'
      RPSGame.new.play # not sure if this is good practise? Instantiating a new object within an object?  Probably not..
    else
      display_goodbye_message
    end
  end

  def play
    display_welcome_message
    human.choose
    computer.choose
    display_winner
    play_again?
  end
end

RPSGame.new.play

