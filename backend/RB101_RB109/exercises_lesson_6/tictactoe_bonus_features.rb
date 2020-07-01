INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                [[1, 5, 9], [3, 5, 7]]

DEFAULT_FIRST_MOVE = 'Choose'
def prompt(msg)
  puts "=> #{msg}"
end

# rubocop:disable Metrics/AbcSize, Metrics/MethodLength
def display_board(brd)
  system 'clear'
  puts "You're a #{PLAYER_MARKER}. The computer is a #{COMPUTER_MARKER}."
  puts "Whoever wins five games is the overall winner."
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end
# rubocop:enable Metrics/AbcSize, Metrics/MethodLength

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
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

def choose_player
  loop do
    prompt "Who would you like to make the first move? Player or Computer?"
    response = gets.chomp
    if response == 'Player'
      return 'Player'
    elsif response == 'Computer'
      return 'Computer'
    else
      prompt "That's not a valid choice. Enter 'Player' or 'Computer'."
    end
    break if response == 'Player' || response == 'Computer'
  end
end

def default_first_player
  move = if DEFAULT_FIRST_MOVE == 'Choose'
           choose_player
         elsif DEFAULT_FIRST_MOVE == 'Player'
           'Player'
         else
           'Computer'
         end
  move
end

def alternate_player(current_ply)
  if current_ply == 'Player'
    return 'Computer'
  else
    return 'Player'
  end
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square (#{joinor(empty_squares(brd))}):"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice"
  end
  brd[square] = PLAYER_MARKER
end

def find_at_risk_square(line, board, marker)
  if board.values_at(*line).count(marker) == 2
    board.select { |k, v| line.include?(k) && v == INITIAL_MARKER }.keys.first
  else
    nil
  end
end

def computer_tactic(brd, marker)
  square = nil
  WINNING_LINES.each do |line|
    square = find_at_risk_square(line, brd, marker)
    break if square
  end
  square
end

def computer_places_piece!(brd)
  square = computer_tactic(brd, PLAYER_MARKER)

  if !square
    square = computer_tactic(brd, COMPUTER_MARKER)
  end

  if !square
    square = if brd[5] == INITIAL_MARKER
               (brd[5] = COMPUTER_MARKER)
             else
               empty_squares(brd).sample
             end
  end
  brd[square] = COMPUTER_MARKER
end

def place_piece!(current_ply, brd)
  if current_ply == 'Player'
    player_places_piece!(brd)
  else
    computer_places_piece!(brd)
  end
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(line[0], line[1], line[2]).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(line[0], line[1], line[2]).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

def initialize_score_board
  {
    'Player': 0,
    'Computer': 0
  }
end

def keep_score(score_brd, brd)
  if detect_winner(brd).nil?
    nil
  else
    score_brd[detect_winner(brd).to_sym] += 1
  end
end

def detect_overall_winner(score_brd)
  if score_brd[:Player] == 5
    return 'Player'
  elsif score_brd[:Computer] == 5
    return 'Computer'
  end
  nil
end

def overall_winner?(score_brd)
  !!detect_overall_winner(score_brd)
end

def valid_y_or_n?(answer)
  if answer == 'y' || answer == 'n'
    true
  else
    false
  end
end

def play_again?
  loop do
    prompt "Play again? (y or n)"
    response = gets.chomp
    if valid_y_or_n?(response)
      if response == 'y'
        return true
      else
        return false
      end
    else
      prompt "Not a valid response. Enter y or n."
    end
  end
end

score_board = initialize_score_board

loop do
  board = initialize_board
  display_board(board)
  current_player = default_first_player
  loop do
    display_board(board)
    place_piece!(current_player, board)
    current_player = alternate_player(current_player)
    break if someone_won?(board) || board_full?(board)
  end

  display_board(board)

  if someone_won?(board)
    prompt "#{detect_winner(board)} won!"
  else
    prompt "It's a tie!"
  end

  keep_score(score_board, board)
  prompt "The overall score is #{score_board}."

  if overall_winner?(score_board)
    prompt "The overall winner is #{detect_overall_winner(score_board)}!"
    score_board = initialize_score_board
  end
  break unless play_again?
end

prompt "Thanks for playing tic tac toe!"
