module CommandMessages

  def game_rules
    puts "Welcome to rock, paper, scissors, lizard, Spock!"
    puts
    puts "The rules of the game are:"
    puts "1) lizard eats paper and poisons Spock"
    puts "2) Spock vaporizes rock and crushes scissors"
    puts "3) Scissors cuts paper and decapitates lizard"
    puts "4) Paper disproves Spock and covers rock"
    puts "5) Rock crushes lizard and crushes scissors"
    puts "6) The first one to win five games is the grand winner"
    puts
    puts "Let the games begin..."
    puts
  end

  def display_goodbye_message
    puts "Thanks for playing Rock, Paper, Scissors, Lizard, Spock!"
  end
  
  def display_winner
    game_winner.nil? ? (puts "It's a tie!") : (puts "The winner of the game is: #{game_winner}!")
  end

  def display_moves
    puts
    puts "#{human.name} chose #{human.move.value}."
    puts "#{computer.name} chose #{computer.move.value}."
  end


  def display_score
    puts
    puts "The current score is..."
    puts "#{human.name}: #{human.score}"
    puts "#{computer.name}: #{computer.score}"
  end

  def display_overall_winner
    puts
    puts "The overall winner is #{overall_winner}! Congratulations!"
  end
end

class Move
  attr_accessor :value, :beats,

  def to_s
    @value
  end

end

class Rock < Move
  def initialize
    @value = 'rock'
    @beats = ['lizard', 'scissors']
  end
end

class Paper < Move
  def initialize
    @value = 'paper'
    @beats = ['spock', 'rock']
  end
end

class Scissors < Move
  def initialize
    @value = 'scissors'
    @beats = ['lizard', 'paper']
  end
end

class Lizard < Move
  def initialize
    @value = 'lizard'
    @beats = ['paper', 'spock']
  end
end

class Spock < Move
  def initialize
    @value = 'spock'
    @beats = ['rock', 'scissors']
  end
end

class Player
  attr_accessor :move, :name, :score

  PLAY_SELECTION = {
    'rock' => Rock.new,
    'paper' => Paper.new,
    'scissors' => Scissors.new,
    'lizard' => Lizard.new,
    'spock' => Spock.new
  }
 
  def initialize
    @score = 0
    set_name
  end
end

class Human < Player
 def set_name
    n = ""
    loop do
      puts "Please enter your name:"
      n = gets.chomp.capitalize
      break unless n.empty?
      puts "Try again. Please enter your name:"
    end
    self.name = n
  end

  def choose
    choice = nil
    loop do
      puts "Do you choose rock, paper, scissors, lizard or spock?"
      choice = gets.chomp.downcase
      break if Player::PLAY_SELECTION.keys.include?(choice)
      puts "Invalid choice, enter rock, paper, scissors, lizard or spock:"
    end
    self.move = Player::PLAY_SELECTION[choice]
  end
end

class Computer < Player
  def set_name
    self.name = ['R2D2', 'Hal', 'Chappie', 'Sony', 'Number 5'].sample
  end

  def choose
    choice = Player::PLAY_SELECTION.keys.sample
    self.move = Player::PLAY_SELECTION[choice]
  end
end

class RPSGame
  include CommandMessages

  attr_accessor :human, :computer, :game_winner, :overall_winner, :score

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def declare_game_winner
    if human.move == computer.move
      self.game_winner = nil
    elsif (human.move.beats).include?(computer.move.value)
      self.game_winner = human.name
    elsif (computer.move.beats).include?(human.move.value)
      self.game_winner = computer.name
    end
  end

  def declare_overall_winner
    if human.score >= 5
      self.overall_winner = human.name
    elsif computer.score >= 5
      self.overall_winner = computer.name
    else
      self.overall_winner = nil
    end
  end
  def update_score
    human.score += 1 if game_winner == human.name
    computer.score += 1 if game_winner == computer.name
  end

  def play_again?
    answer = ""

    loop do
      puts
      puts "Would you like to play again? Enter y or n:"
      answer = gets.chomp
      break if ['y', 'n'].include?(answer.downcase)
      puts "Incorrect response, enter y or n:"
    end

    answer == 'y'
  end

  def overall_winner?
    declare_overall_winner
    overall_winner != nil
  end

  def play
    system 'clear'
    game_rules

    loop do
      human.choose
      computer.choose
      display_moves
      declare_game_winner
      update_score
      display_winner
      display_score
      break if overall_winner? || play_again? == false
      system 'clear'
    end

    display_overall_winner if overall_winner?
    display_goodbye_message
  end
end

RPSGame.new.play
