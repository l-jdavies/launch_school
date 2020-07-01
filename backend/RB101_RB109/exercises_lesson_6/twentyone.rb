SUITS = [:Hearts, :Diamonds, :Clubs, :Spades]
CARD = (0..12).to_a
DECK = {
  Hearts: [2, 3, 4, 5, 6, 7, 8, 9, 10, 'Jack', 'Queen', 'King', 'Ace'],
  Diamonds: [2, 3, 4, 5, 6, 7, 8, 9, 10, 'Jack', 'Queen', 'King', 'Ace'],
  Clubs: [2, 3, 4, 5, 6, 7, 8, 9, 10, 'Jack', 'Queen', 'King', 'Ace'],
  Spades:  [2, 3, 4, 5, 6, 7, 8, 9, 10, 'Jack', 'Queen', 'King', 'Ace']
}
FACE_CARDS = %w(Jack Queen King)
TARGET = 21
LIMIT = 17

def prompt(msg)
  puts "=> #{msg}"
end

# rubocop:disable Metrics/AbcSize, Metrics/MethodLength
def game_rules
  system 'clear'
  prompt "Welcome to Twenty-One!"
  puts
  prompt "The game has two players - you and the dealer"
  prompt "You will be dealt two cards."
  prompt "You will see your cards and one of the dealer's cards."
  prompt "The aim is to get to as close to #{TARGET} as possible,"
  prompt "without going over."
  puts
  prompt "Numbered cards are assigned their face value;"
  prompt "jack, queen and king have a value of 10."
  prompt "If the sum value of your cards is greater than #{TARGET},"
  prompt "you go bust and the dealer wins."
  prompt "You can choose to 'deal' to receive another card,"
  prompt "or 'stay' to stick with the cards you have."
  puts
  prompt "Once you stick, the dealer will take a turn."
  prompt "If the dealer goes bust, you win."
  prompt "If the dealer choses to 'stay',"
  prompt "the sum value of your cards will be compared to the dealer's."
  prompt "Whoever is closet to #{TARGET} is the winner."
  puts
  prompt "Ace cards can have a value of 1 or 11."
  prompt "The value will be decided by the computer."
  prompt "If a giving ace a value of 11 results in a hand going bust,"
  prompt "ace will be valued as 1."
  puts
  prompt "Good luck!"
end
# rubocop:enable Metrics/AbcSize, Metrics/MethodLength

def start_game
  prompt "Enter 'y' when you understand the rules and are ready to begin..."
  answer = gets.chomp
  answer == 'y' ? (system 'clear') : false
end

def deal_card
  suit = SUITS.sample
  index = CARD.sample

  DECK[suit][index]
end

def initial_player_hand
  ply_hand = []
  ply_hand << deal_card
  ply_hand << deal_card
end

def display_initial_cards(deal_hand, ply_hand, value_ply_hand)
  puts "Dealer cards are: #{deal_hand[0]} and unknown card"
  display_card_hand(ply_hand, 'Player')
  display_card_hand_value(value_ply_hand, 'Player')
end

def value_of_face_cards(hand)
  10 * (hand.count { |element| FACE_CARDS.include?(element) })
end

def value_of_number_cards(hand)
  value = 0
  hand.each do |element|
    if element.is_a?(Integer)
      value += element
    end
  end
  value
end

# rubocop:disable Metrics/LineLength
def value_of_ace(hand)
  ace = 0
  if hand.include?("Ace")
    hand.count("Ace").times do
      if (value_of_face_cards(hand) + value_of_number_cards(hand) + ace + 11) <= TARGET
        ace += 11
      else
        ace += 1
      end
    end
  end
  ace
end
# rubocop:enable Metrics/LineLength

def value_of_hand(hand)
  value_of_face_cards(hand) + value_of_number_cards(hand) + value_of_ace(hand)
end

def busted?(val_hand)
  val_hand.sum > TARGET ? true : false
end

def hit!(hand)
  hand << deal_card
end

def bust_status(user)
  puts
  puts "#{user} has gone bust."
end

def stay_status(user)
  puts
  puts "#{user} has stayed."
end

def display_card_hand_value(val_hand, user)
  puts
  puts "The value of the #{user.downcase} hand is #{val_hand.join}."
end

def display_card_hand(hand, user)
  puts "#{user} cards are: #{hand.join(', ')}"
end

def update_val_hand!(val_hand, hand)
  val_hand[0] = value_of_hand(hand)
end

def compare_cards(val_ply_hand, val_deal_hand)
  if val_ply_hand.sum > val_deal_hand.sum
    'Player'
  elsif val_deal_hand.sum > val_ply_hand.sum
    'Dealer'
  elsif val_ply_hand.sum == val_deal_hand.sum
    "It's a tie!"
  end
end

def hit_or_stay
  puts
  puts "It's the player's turn. Enter 'hit' or 'stay':"
  gets.chomp
end

# rubocop:disable Metrics/MethodLength
def player_turn(hand, val_hand)
  answer = nil
  loop do
    answer = hit_or_stay

    if answer == 'hit'
      hit!(hand)
      update_val_hand!(val_hand, hand)
      display_card_hand(hand, 'Player')
      display_card_hand_value(val_hand, 'Player')
    end
    break if answer == 'stay' || busted?(val_hand)
  end

  if busted?(val_hand)
    bust_status("Player")
  else
    stay_status("Player")
  end
end
# rubocop:enable Metrics/MethodLength

def dealer_turn(hand, val_hand)
  puts
  puts "It's the dealer's turn."
  hand << deal_card

  until val_hand.sum >= LIMIT || busted?(val_hand)
    hand << deal_card
    update_val_hand!(val_hand, hand)
  end

  if busted?(val_hand)
    display_card_hand_value(val_hand, 'Dealer')
    bust_status("Dealer")
  else
    stay_status("Dealer")
  end
end

def valid_y_or_n?(answer)
  answer == 'y' || answer == 'n'
end

def play_again?
  loop do
    puts
    puts "Play again? (y or n)"
    response = gets.chomp
    if valid_y_or_n?(response)
      if response == 'y'
        return true
      else
        return false
      end
    else
      puts "Not a valid response. Enter y or n."
    end
  end
end

def detect_winner(val_ply_hand, val_deal_hand, deal_hand)
  if busted?(val_ply_hand)
    'Dealer'
  elsif busted?(val_deal_hand)
    'Player'
  elsif deal_hand.count > 1
    compare_cards(val_ply_hand, val_deal_hand)
  end
end

def someone_won?(val_ply_hand, val_deal_hand, deal_hand)
  if detect_winner(val_ply_hand, val_deal_hand, deal_hand) == "It's a tie!"
    false
  else
    true
  end
end

def initialize_score_board
  {
    'Player': 0,
    'Dealer': 0
  }
end

def keep_score(score_brd, win)
  score_brd[win.to_sym] += 1
end

def display_winner(val_ply_hand, val_deal_hand, deal_hand)
  if detect_winner(val_ply_hand, val_deal_hand, deal_hand) == "It's a tie!"
    puts
    puts "It's a tie!"
  else
    puts
    puts "The #{detect_winner(val_ply_hand, val_deal_hand, deal_hand).downcase} is the winner!"
  end
end

def display_overall_winner(score_brd)
  puts
  puts "The first to win five games is the overall winner."
  puts "The overall score is:"
  score_brd.each_pair { |k, v| puts "#{k} = #{v}" }
end

def detect_overall_winner(score_brd)
  if score_brd[:Player] == 5
    'Player'
  elsif score_brd[:Dealer] == 5
    'Dealer'
  end
end

def overall_winner?(score_brd)
  !!detect_overall_winner(score_brd)
end

loop do
  game_rules
  break if start_game
end

score_board = initialize_score_board
winner = nil
loop do
  system 'clear'
  player_hand = initial_player_hand
  dealer_hand = [] << deal_card

  value_player_hand = [] << value_of_hand(player_hand)
  value_dealer_hand = [] << value_of_hand(dealer_hand)

  display_initial_cards(dealer_hand, player_hand, value_player_hand)

  player_turn(player_hand, value_player_hand)

  if !busted?(value_player_hand)
    dealer_turn(dealer_hand, value_dealer_hand)
    display_card_hand_value(value_player_hand, 'Player')
    display_card_hand_value(value_dealer_hand, 'Dealer')
  end

  display_winner(value_player_hand, value_dealer_hand, dealer_hand)
  winner = detect_winner(value_player_hand, value_dealer_hand, dealer_hand)
  if someone_won?(value_player_hand, value_dealer_hand, dealer_hand)
    keep_score(score_board, winner)
  end

  display_overall_winner(score_board)

  if overall_winner?(score_board)
    puts
    puts "The overall winner is the #{detect_overall_winner(score_board).downcase}!"
    score_board = initialize_score_board
  end

  break unless play_again?
end

puts "Thanks for playing Twenty-One!"
