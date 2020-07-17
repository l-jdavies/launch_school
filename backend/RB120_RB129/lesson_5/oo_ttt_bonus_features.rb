require 'byebug'
module DisplayMessages
  def display_score
    puts ""
    puts "The current scores are..."
    puts "#{human.name} has: #{human.score}."
    puts "#{computer.name} has: #{computer.score}"
    puts ""
  end

  def display_welcome_message
    puts "Hi #{human.name}! Welcome to Tic Tac Toe! You'll be playing against #{computer.name}."
    puts
  end

  def display_goodbye_message
    puts "Thanks for playing Tic Tac Toe! Goodbye!"
  end

  def clear_screen_and_display_board
    system 'clear'
    puts "#{human.name}, you're a #{human.marker}."
    puts "#{computer.name} is a #{computer.marker}."
    puts ""
    board.draw
  end

  def display_board
    puts "#{human.name}, you're a #{human.marker}."
    puts "#{computer.name} is a #{computer.marker}."
    puts ""
    board.draw
  end

  def display_play_again_message
    puts "Let's play again..."
    puts ""
  end

  def clear
    system 'clear'
  end
  
  def display_result
    clear_screen_and_display_board

    case board.winning_marker
    when human.marker
      puts "You won!"
    when computer.marker
      puts "The computer won!"
    else
      puts "It's a tie!"
    end
  end
end

class Board
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                  [[1, 5, 9], [3, 5, 7]]

  def initialize
    @squares = {}
    reset
  end

  def []=(key, marker)
    @squares[key].marker = marker
  end

  def unmarked_keys
    @squares.keys.select { |key| @squares[key].unmarked? }
  end

  def full?
    unmarked_keys.empty?
  end

  def someone_won?
    !!winning_marker
  end

  def winning_marker
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)
      if three_identical_markers?(squares)
        return squares.first.marker
      end
    end
    nil
  end

  def reset
    (1..9).each { |key| @squares[key] = Square.new }
  end

  # rubocop:disable Metrics/AbcSize
  # rubocop:disable Metrics/MethodLength
  def draw
    puts "     |     |"
    puts "  #{@squares[1]}  |  #{@squares[2]}  |  #{@squares[3]}  "
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[4]}  |  #{@squares[5]}  |  #{@squares[6]}  "
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[7]}  |  #{@squares[8]}  |  #{@squares[9]}  "
    puts "     |     |"
    puts ""
  end
  # rubocop:enable Metrics/AbcSize
  # rubocop:enable Metrics/MethodLength

  private

  def three_identical_markers?(squares)
    markers = squares.select(&:marked?).collect(&:marker)
    return false if markers.size != 3
    markers.min == markers.max
  end
end

class Square
  INITIAL_MARKER = " "

  attr_accessor :marker

  def initialize(marker=INITIAL_MARKER)
    @marker = marker
  end

  def to_s
    @marker
  end

  def marked?
    marker != INITIAL_MARKER
  end

  def unmarked?
    marker == INITIAL_MARKER
  end
end

class Player
  attr_reader :marker, :name
  attr_accessor :score

  def initialize
    @marker = nil
    @score = 0
    reset_marker_options
  end

  def reset_marker_options
    @@marker_options = ['X', 'O']
  end
end

class Human < Player
  def initialize
    super
    set_name
  end

  def set_name
    n = ""
    loop do
      puts "Please enter your name:"
      n = gets.chomp.capitalize
      break unless n.empty?
      puts "Try again. Please enter your name:"
    end
    @name = n
  end

  def choose_marker
    reset_marker_options

    choice = nil
    loop do
      puts "Would you like to play as an '#{@@marker_options[0]}' or '#{@@marker_options[1]}'?"
      choice = gets.chomp.upcase
      break if @@marker_options.include?(choice)
      puts "Sorry that's not a valid choice, enter '#{@@marker_options[0]}' or '#{@@marker_options[1]}':"
    end

    @marker = @@marker_options.delete(choice)
  end
end

class Computer < Player
  def initialize
    super
    @name = ['R2D2', 'Bob the computer', 'Mac'].sample
  end

  def choose_marker
    @marker = @@marker_options[0]
  end
end

class TTTGame
  include DisplayMessages

  attr_reader :board, :human, :computer

  def initialize
    @board = Board.new
    @human = Human.new
    @computer = Computer.new
  end

  def play
    clear
    display_welcome_message
    main_game
    display_goodbye_message
  end

  private

  def main_game
    loop do
      select_markers
      display_board
      player_move
      display_result
      update_score
      display_score
      break unless play_again?
      reset
      display_play_again_message
    end
  end
  
  def human_moves
    puts "Choose a square between #{joinor(board.unmarked_keys)}:"
    square = nil
    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)
      puts "Sorry invalid option. Enter #{joinor(board.unmarked_keys)}:"
    end

    board[square] = human.marker
  end
  
  def computer_moves
    board[board.unmarked_keys.sample] = computer.marker
  end

  def select_markers
    human.choose_marker
    computer.choose_marker
    @current_marker = human.marker
  end

  def player_move
    loop do
      current_player_moves
      break if board.someone_won? || board.full?
      clear_screen_and_display_board if human_turn?
    end
  end

  def update_score
    case board.winning_marker
    when human.marker
      human.score += 1
    when computer.marker
      computer.score += 1
    end
  end

  def joinor(array)
    array_with_delimiter = []

    array.each_with_index do |item, index|
      if index == array.size - 2
        array_with_delimiter << item << ' or '
      elsif index == array.size - 1
        array_with_delimiter << item
      else
        array_with_delimiter << item << ', '
      end
    end
    array_with_delimiter.join
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp.downcase
      break if %w(y n).include?(answer)
      puts "Sorry, must be y or n"
    end

    answer == 'y'
  end

  def reset
    board.reset
    @current_marker = human.marker
    clear
  end

  def human_turn?
    @current_marker == human.marker
  end

  def current_player_moves
    if human_turn?
      human_moves
      @current_marker = computer.marker
    else
      computer_moves
      @current_marker = human.marker
    end
  end
end

game = TTTGame.new
game.play
