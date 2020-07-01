# 1. Create method called joinor
#
# Separate all items in a list with a comma, apart from the last item, which should be separated with 'or'
#
# INPUT
# array of integers
#
# OUTPUT
# string
# each integer as a string separated by ,
# separate the last and second to last item with 'or'
#
# ALGORITHM
# print an array of integers to output
# separate each integer in the string with a ','
# separate the second from last and last item with 'or'
#
# START
# SET array_with_delimiter = []
#
# array.each_with_index do |item, index|
#   if index == -2
#     array_with_delimiter << item << ' or '
#   elsif index == -1
#     array_with_delimiter << item
#   else
#     array_with_delimiter << item << ', '
#   end
# end
#
# array_with_delimiter.join
# END

require 'byebug'
def joinor(array)
  array_with_delimiter = []

  array.each_with_index do |item, index|
    if index == array.size - 2
      array_with_delimiter << item << ' or '
    elsif index == array.size - 1
      array_with_delimiter << item
    else
      #byebug
      array_with_delimiter << item << ', '
    end
  end
  array_with_delimiter.join
end

joinor([1,2,3,4,5])

# 2. Keep score

#  Keep score of how many times the player and computer each win
#  Don't use global or instance variables.
#  Make it so that the first player to 5 wins the game.
#

# can't use global variables
# create method to keep track of score
# use a hash to store scores
# could use return value 'Player' or 'Computer' from #detect_winner to determine who winner was
# 
# START => keep_score
# score = {     => use return value of #detect_winner as hash key
# 'Player': 0
# 'Computer': 0
# }
#
# score[detect_winner] += 1
# END 
# 
# #keep_score tracks overall score. Print hash to output within #display_board
# create another method to determine who the overall winner is (5 games won)
# create another method to return boolean value if an overall winner has been declared
# need to save the score board as a separate variable so I can call the score board (to print) without changing the scpre
def initialize score_board
  score = {
    'Player': 0,
    'Computer': 0
  }
end

score_board = initialize_score_board

def keep_score(score_brd, brd)
  score_brd[detect_winner(brd).to_sym] += 1
end

def detect_overall_winner(score_brd)
  if score_brd[:Player] == 5
    return 'Player'
  else score_brd[:Computer] == 5
    return 'Computer'
  end
end

def overall_winner?(score_brd)
  !!detect_overall_winner(score_brd)
end


# 3. select who plays first
# Can you change the game so that the computer moves first?
# Can you make this a setting at the top (i.e. a constant), so that you could play the game with either player or computer going first? 
# Can you make it so that if the constant is set to "choose", then your game will prompt the user to determine who goes first?
# Valid options for the constant can be "player", "computer", or "choose".

# use a constant to declare the default first player. Can be changed to player, computer or choose
# create method that determines default player from constant and changes game play accordingly
# abstract placing of piece to player agnostic method (pass in current player)
# create a method to determine the alternate_player

DEFAULT_FIRST_MOVE = 'Choose'
current_player = nil

def default_first_player(current_ply)
  if DEFAULT_FIRST_MOVE == 'Choose'
    prompt "Who would you like to make the first move? 'Player' or 'Computer'?"
    response = gets.chomp
    if response == 'Player'
      current_player = 'Player'
    elsif response == 'Computer'
      current_player = 'Computer'
    else
      prompt "That's not a valid choice. Enter 'Player' or 'Computer'."
    end
  elsif DEFAULT_FIRST_MOVE == 'Player'
    current_player = 'Player'
  else
    current_player = 'Computer'
  end
end

def place_piece!(current_ply, brd)
  current_ply == 'Player' ? player_places_piece!(brd) : computer_places_piece!(brd)
end

# 4. Create algorithm so computer plays defensively
# That's not very interesting. Let's make the computer defensive minded, so that if there's an immediate threat, then it will defend the 3rd square
# We'll consider an "immediate threat" to be 2 squares marked by the opponent in a row
# If there's no immediate threat, then it will just pick a random square.
#
# Use WINNING_LINES
# Need to determine if 2/3 elements in each WINNING_LINES sub-array contain 'X'?
# If yes, select the third empty square in the array
# if no, select any empty square
# need to return an array of hashes with each nested array containing the square as the key
# and the current marker as the value for each winning line combination
#
# START => extract to method #board_status
# => return an array containing 'X', 'O' or ' ' value for each WINNING_LINES key
# board_status = WINNING_LINES.map do |subarr|
#   subarr.map do |key|
#     board[key]
#   end
# end
# => returns nested array of board values

# couldn't get this to work, ended up using LS solution
# #values_at method returns an array containing the elements in self that correspond to the 
# given selector
# Selctors can be integer indices or ranges
# The splat operator (*line) is short hand for the `line` array as a comma-separated list
# i.e. line[0], line[1], line[2]
# Breaking down the line: board.select{|k,v| line.include?(k) && v == ' '}.keys.first
# the #select method is called with a block as an argument to select any key-value pair in which the value is equal to ' '
# the #keys method returns the keys from the selected elements as a sub-array
# the #first method returns the first object from that sub-array, which in this case is an integer
# the returned value can then be passed into another method
#
#
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                [[1, 5, 9], [3, 5, 7]]
require 'byebug'
def find_at_risk_square(line, board)
  byebug
	if board.values_at(*line).count('X') == 2
    board.select{|k,v| line.include?(k) && v == ' '}.keys.first
	else
    nil
  end
end

board = {}
(1..9).each do |num|
  board[num] = ' '
end

board[1] = 'X'
board[2] = 'X'

WINNING_LINES.each do |subarr|
  find_at_risk_square(subarr, board)
end 
 
