class Move
  attr_accessor :value, :beats, :game_winner, :overall_winner

  def to_s
    @value
  end
  
  def >(other)
    beats.include?(other)      
  end

  def <(other)
    beats.include?(other)
  end
end

class Score
  def initialize
    @wins = 0
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
    @beats = ['spock', 'lizard']
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
  attr_accessor :move, :name

  PLAY_SELECTION = {
    'rock' => Rock.new,
    'paper' => Paper.new,
    'scissors' => Scissors.new,
    'lizard' => Lizard.new,
    'spock' => Spock.new
  }
 
  def initialize
    set_name
  end
end

class Human < Player
 def set_name
    n = ""
    loop do
      puts "Please enter your name:"
      n = gets.chomp
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

  attr_accessor :human, :computer, :game_winner, :overall_winner

  def initialize
    @human = Human.new
    @computer = Computer.new
    @game_winner = nil
    @overall_winner = nil
  end

  def display_welcome_message
    puts "Welcome to Rock, Paper, Scissors, Lizard, Spock!"
  end

  def display_goodbye_message
    puts "Thanks for playing Rock, Paper, Scissors, Lizard, Spock!"
  end

  def display_moves
    puts "#{human.name} chose #{human.move}."
    puts "#{computer.name} chose #{computer.move}."
  end

   def declare_game_winner
     if (human.move).to_s == (computer.move).to_s
       puts "It's a tie!"
     elsif (human.move.beats).include?((computer.move).to_s)
       puts "Human wins"
     else
       puts "Computer wins"
     end
  end
 
  def display_winner
    puts "The winner is #{game_winner}!"
  end

  def play_again?
    answer = ""

    loop do
      puts "Would you like to play again? Enter y or n:"
      answer = gets.chomp
      break if ['y', 'n'].include?(answer.downcase)
      puts "Incorrect response, enter y or n:"
    end

    answer == 'y'
  end

  def play
    display_welcome_message

    loop do
      human.choose
      computer.choose
      declare_game_winner
      display_moves
      display_winner
      break unless play_again?
    end

    display_goodbye_message
  end
end

RPSGame.new.play
