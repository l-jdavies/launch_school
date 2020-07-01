# INITIAL PROGRAM
# Following video walk through
# Build Rock Paper Scissors game
# User makes a choice
# Computer makes a choice
# Winner is displayed

# BONUS FEATURES
# INPUTS
# - User will input one of five string options - rock, paper, scissors,
# lizard or Spock
# - Other input will be computer selection of same string options#
# OUTPUTS
# - Print the winner of the game

# RULES
# - RULES OF GAME PLAY
# - scissors beats paper and lizard
# - paper beats rock and Spock
# - rock beats lizard and scissors
# - lizard beats spock and paper
# - spock beats scissors and rock

# - RULES OF PROGRAM
# - user inputs one letter - use 's' for scissors
# - 'S' for spock
# - write method to keep track of wins
# - game ends when one player wins 5 games
#
# EXAMPLES
# User: paper, Computer: spock -> user wins,
# User: Spock, computer: lizard -> computer wins,
# User: scissors, computer: paper -> user wins
#
# DATA STRUCTURE
# - Input and outputs will be strings
# - Create hash containing input as the key and options
# - that can beat the input as the values
# - create computer_win and user_win variables
# - increment either variable depending on result
#
# ALGORITHM
# - validate input from user
# - assign user input to variable
# - assign computer selection to variable
# - use hash to check if computer selection is present in
# - values associated with user input 'key'
# - if yes user is winner
# - print to screen
# - increment user_win variable by one
# - if no, perform same process but for computer
# - when computer_win or user_win == 5
# - declare grand winner
#
# START
#
# SET user_choice = ''
# SET computer_choice = ''
# SET computer_wins = 0
# SET user_wins = 0
#
# WHILE computer_wins == < 5 || user_wins == < 5
#   SET user_choice as key
#   IF user_choice == computer_choice
#      puts "It's a tie"
#   IF game_rules[user_choice].include?(computer_choice)
#      user declared winner
#      increment user_wins += 1
#   ELSE
#     computer declared winner
#     increment computer_wins += 1

#   PRINT winner of game
#   PRINT grand winner
#
# END

# Code review: https://launchschool.com/posts/b17121f2 

require 'pry'

VALID_CHOICES = ['r', 'p', 's', 'S', 'l']

def win?(rules, first, second)
  rules[first.to_sym].include?(second)
end

def display_results(rules, player, computer)
  if win?(rules, player, computer)
    prompt("You won! +1 to you")
  elsif win?(rules, computer, player)
    prompt("The computer won! +1 to the computer")
  else
    prompt("It's a tie! Neither of you score")
  end
end

def score_of_wins(rules, player, computer, score_hash)
  if win?(rules, player, computer)
    score_hash[:user_score] += 1
  elsif win?(rules, computer, player)
    score_hash[:computer_score] += 1
  else
    return
  end
end

def prompt(message)
  puts("=> #{message}")
end

game_rules = {
  r: ['l', 's'],
  p: ['S', 'r'],
  s: ['l', 'p'],
  S: ['r', 's'],
  l: ['S', 'p']
}

game_key = {
  r: 'rock',
  p: 'paper',
  s: 'scissors',
  S: 'Spock',
  l: 'lizard'
}

choose_option = <<~HEREDOC
  Which option would you like to select? Enter:
    r for #{game_key[:r]}
    p for #{game_key[:p]}
    s for #{game_key[:s]}
    l for #{game_key[:l]}
    S for #{game_key[:S]}
  HEREDOC

scores = {
  user_score: 0,
  computer_score: 0
}

puts prompt("Welcome to rock, paper, scissors, lizard, Spock!")
puts prompt("In addition to the usual rules:")
puts prompt("1) lizard eats paper and poisons Spock")
puts prompt("2) Spock vaporizes rock and crushes scissors")
puts prompt("3) The first one to win five games is the grand winner")
puts prompt("Let the games begin...")

loop do
  user_choice = ''
  loop do
    prompt(choose_option)
    user_choice = gets.chomp
    if VALID_CHOICES.include?(user_choice)
      break
    else prompt("That's not a valid choice.")
    end
  end

  computer_choice = VALID_CHOICES.sample

  user_choice_key = user_choice.to_sym
  computer_choice_key = computer_choice.to_sym

  puts prompt("You chose #{game_key[user_choice_key]} and the computer chose \\
              #{game_key[computer_choice_key]}")

  puts display_results(game_rules, user_choice, computer_choice)
  score_of_wins(game_rules, user_choice, computer_choice, scores)

  if scores[:user_score] < 5 && scores[:computer_score] < 5
    puts prompt("Let's play again to determine the grand winner! \\
                The current scores are you: #{scores[:user_score]}, \\
                computer: #{scores[:computer_score]}")
  elsif scores[:user_score] >= 5
    puts prompt("You are the grand winner!!")
    break
  else
    scores[:computer_score] >= 5
    puts prompt("The computer is the grand winner!!")
    break
  end
end

prompt("Thank you for playing. Goodbye")


