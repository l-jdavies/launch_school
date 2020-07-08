module CommandMessages
  # rubocop:disable Metrics/MethodLength
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
  # rubocop:enable Metrics/MethodLength

  def display_goodbye_message
    puts
    puts "Thanks for playing Rock, Paper, Scissors, Lizard, Spock!"
  end

  def display_winner
    if game_winner.nil?
      puts "It's a tie!"
    else
      puts "The winner of the game is: #{game_winner}!"
    end
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
    puts "The grand winner is #{overall_winner}! Congratulations!"
  end

  def display_human_move_history
    puts
    puts "#{human.name} made these moves:"
    human.move_history.each_with_index do |move, idx|
      puts "Move #{idx + 1} was #{move}"
    end
  end

  def display_computer_move_history
    puts
    puts "#{computer.name} made these moves:"
    computer.move_history.each_with_index do |move, idx|
      puts "Move #{idx + 1} was #{move}"
    end
  end
end

class Move
  attr_accessor :value, :beats,

  # rubocop:disable Style/AlignParameters (cant figure out this problem)
  def to_s
    value
  end
  # rubocop:enable Style/AlignParameters

  def >(other)
    beats.include?(other.value)
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
  attr_accessor :move, :name, :score, :move_history

  PLAY_SELECTION = {
    'rock' => Rock.new,
    'paper' => Paper.new,
    'scissors' => Scissors.new,
    'lizard' => Lizard.new,
    'spock' => Spock.new
  }

  def initialize
    @move_history = []
    @score = 0
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
    move_history << choice
  end
end

class Computer < Player
end

class R2D2 < Computer
  def initialize
    self.name = 'R2D2'
    @move_history = []
    @score = 0
  end

  def choose
    choice = 'lizard'
    self.move = Player::PLAY_SELECTION[choice]
    move_history << choice
  end
end

class Hal < Computer
  def initialize
    self.name = 'Hal'
    @move_history = []
    @score = 0
  end

  def choose
    choice = ['rock', 'paper'].sample
    self.move = Player::PLAY_SELECTION[choice]
    move_history << choice
  end
end

class Chappie < Computer
  def initialize
    self.name = 'Chappie'
    @move_history = []
    @score = 0
  end

  def choose
    choice = ['rock', 'paper', 'lizard', 'spock'].sample
    self.move = Player::PLAY_SELECTION[choice]
    move_history << choice
  end
end

class Sony < Computer
  def initialize
    self.name = 'Sony'
    @move_history = []
    @score = 0
  end

  def choose
    choice = ['paper', 'scissors'].sample
    self.move = Player::PLAY_SELECTION[choice]
    move_history << choice
  end
end

class Number5 < Computer
  def initialize
    self.name = 'Number 5'
    @move_history = []
    @score = 0
  end

  def choose
    choice = ['lizard', 'spock'].sample
    self.move = Player::PLAY_SELECTION[choice]
    move_history << choice
  end
end

class RPSGame
  include CommandMessages

  attr_accessor :human, :computer, :game_winner, :overall_winner, :score

  def initialize
    @human = Human.new
    @computer = [R2D2.new, Hal.new, Chappie.new, Sony.new, Number5.new].sample
  end

  def declare_game_winner
    self.game_winner = if human.move > computer.move
                         human.name
                       elsif computer.move > human.move
                         computer.name
                       end
  end

  def declare_overall_winner
    self.overall_winner = if human.score >= 5
                            human.name
                          elsif computer.score >= 5
                            computer.name
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

  # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
  def play
    system 'clear'
    game_rules

    human.set_name
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
    display_human_move_history
    display_computer_move_history
    display_goodbye_message
  end
  # rubocop:enable Metrics/AbcSize, Metrics/MethodLength
end

RPSGame.new.play
