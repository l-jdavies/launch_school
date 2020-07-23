module DisplayMessages
  def display_card_hand
    puts ""
    puts "#{name.capitalize}'s cards are: #{hand.cards.join(', ')}."
  end

  def display_hit_or_stay_message
    response = nil
    loop do
      puts ""
      puts "Would you like to 'hit' or 'stay'?"
      puts "Please enter your move:"
      response = gets.chomp.downcase
      break if %w(hit h stay s).include?(response)
      puts "Invalid response."
    end

    player.move = response
  end

  def display_hand_value
    puts ""
    puts "The total value of #{name}'s hand is: #{hand.hand_total}"
  end

  def display_winner
    puts "The winner is #{name}!"
  end

  def display_lose
    puts "#{player.name} and #{dealer.name} both went bust."
    puts "You both lose!"
  end

  def display_tie
    puts "It's a tie!"
  end

  # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
  def game_rules
    system 'clear'
    puts "Welcome to Twenty-One!"
    puts
    puts "The game has two players - you and the dealer"
    puts "You will be dealt two cards."
    puts "You will see your cards and one of the dealer's cards."
    puts "The aim is to get to as close to #{Game::TARGET} as possible,"
    puts "without going over."
    puts
    puts "Numbered cards are assigned their face value;"
    puts "jack, queen and king have a value of 10."
    puts "If the sum value of your cards is greater than #{Game::TARGET},"
    puts "you go bust and the dealer wins."
    puts "You can choose to 'deal' to receive another card,"
    puts "or 'stay' to stick with the cards you have."
    puts
    puts "Once you stick, the dealer will take a turn."
    puts "If the dealer goes bust, you win."
    puts "If the dealer choses to 'stay',"
    puts "the sum value of your cards will be compared to the dealer's."
    puts "Whoever is closet to #{Game::TARGET} is the winner."
    puts
    puts "Ace cards can have a value of 1 or 11."
    puts "The value will be decided by the computer."
    puts "If a giving ace a value of 11 results in a hand going bust,"
    puts "ace will be valued as 1."
    puts
    puts "Good luck!"
  end
  # rubocop:enable Metrics/AbcSize, Metrics/MethodLength

  def display_goodbye_message
    puts ""
    puts "Thanks for playing Twenty-One. Goodbye!"
  end
end

class Card
  def initialize(suit, face)
    @suit = suit
    @face_value = face
  end
end

class Deck
  attr_accessor :deck

  def initialize
    @deck = create_deck.shuffle!
  end

  def deal
    deck.sample
  end

  private

  def create_deck
    cards = []

    suits = %w(Hearts Diamond Spade Clubs)
    face = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'Jack', 'Queen', 'King', 'Ace']

    face.each do |card_face|
      suits.each do |card_suit|
        cards << Card.new(card_suit, card_face)
      end
    end
  end
end

class Hand
  attr_accessor :cards, :hand_total

  FACE_CARDS = %w(Jack Queen King)

  def initialize
    @cards = []
    @hand_total = 0
  end

  def hit!(deck)
    cards << deck.deal
    update_value_of_hand
  end

  def >(other)
    hand_total > other.hand_total
  end

  def ==(other)
    hand_total == other.hand_total
  end

  def update_value_of_hand
    self.hand_total = if ace?
                        value_face_cards + value_number_cards + value_ace
                      else
                        value_face_cards + value_number_cards
                      end
  end

  def reset
    @cards = []
    @hand_total = 0
  end

  private

  def value_face_cards
    10 * cards.count { |element| FACE_CARDS.include?(element) }
  end

  def value_number_cards
    value = 0
    cards.each do |element|
      value += element if element.is_a?(Integer)
    end
    value
  end

  def value_ace
    ace = 0

    current_total = value_face_cards + value_number_cards

    cards.count("Ace").times do
      ace += if current_total + ace + 11 <= Game::TARGET
               11
             else
               1
             end
    end
    ace
  end

  def ace?
    cards.include?("Ace")
  end
end

class Participant
  include DisplayMessages

  attr_accessor :hand, :move
  attr_reader :name

  def initialize
    @hand = Hand.new
    @move = nil
  end

  def busted?
    hand.hand_total > Game::TARGET
  end

  def twentyone?
    hand.hand_total == Game::TARGET
  end

  def display_hand_details
    display_card_hand
    display_hand_value
  end

  def hit(deck)
    hand.hit!(deck)
    display_hand_details
  end

  def stay
    puts ""
    puts "#{name.capitalize} has decided to stay..."
  end

  def bust
    puts ""
    puts "#{name.capitalize} has gone bust!"
  end
end

class Player < Participant
  def set_name
    n = ""
    loop do
      puts ""
      puts "Please enter your name:"
      n = gets.chomp.capitalize
      break unless n.empty? || ('A'..'Z').cover?(n) == false
      puts "Try again. Please enter your name:"
    end
    @name = n
  end

  def hit?
    %w(hit h).include?(move)
  end

  def stay?
    %w(stay s).include?(move)
  end
end

class Dealer < Participant
  def set_name
    @name = "the dealer"
  end

  def stay
    puts ""
    puts "#{name.capitalize} has decided to stay..."
    display_hand_value
  end
end

class Game
  include DisplayMessages

  TARGET = 21
  LIMIT = 17
  attr_accessor :player, :dealer, :deck

  def initialize
    @player = Player.new
    @dealer = Dealer.new
    @deck = Deck.new
  end

  def start
    set_up_game
    game_play
    display_goodbye_message
  end

  private

  def game_play
    loop do
      deal_cards
      player_turn
      dealer_turn
      declare_winner
      break unless play_again?
      reset_game
    end
  end

  def set_up_game
    game_rules
    set_contestant_name
  end

  def set_contestant_name
    player.set_name
    dealer.set_name
  end

  def deal_cards
    2.times do |_|
      player.hand.hit!(deck)
      dealer.hand.hit!(deck)
    end
  end

  def player_turn
    player.display_hand_details
    player_move

    player.bust if player.busted?
  end

  def player_move
    loop do
      break if player.twentyone? || player.busted?
      display_hit_or_stay_message
      if player.hit?
        player.hit(deck)
      elsif player.stay?
        player.stay
        break
      end
    end
  end

  def dealer_turn
    puts ""
    puts "It's the dealer's turn..."

    dealer_move

    if dealer.busted?
      dealer.bust
    else
      dealer.stay
    end
  end

  def dealer_move
    until dealer.hand.hand_total >= LIMIT || dealer.busted?
      sleep(2)
      puts ""
      puts "The dealer has decided to hit."
      dealer.hit(deck)
    end
  end

  def declare_winner
    puts ""

    if someone_busted?
      winner_with_bust
    else
      winner_no_bust
    end
  end

  def someone_busted?
    player.busted? || dealer.busted?
  end

  def winner_with_bust
    if player.busted? && dealer.busted?
      display_lose
    elsif player.busted?
      dealer.display_winner
    elsif dealer.busted?
      player.display_winner
    end
  end

  def winner_no_bust
    if player.hand > dealer.hand
      player.display_winner
    elsif dealer.hand > player.hand
      dealer.display_winner
    else
      display_tie
    end
  end

  def play_again?
    response = nil

    loop do
      puts ""
      puts "Would you like to play again? (y/n)"
      response = gets.chomp.downcase
      break if %w(yes y no n).include?(response)
      puts "Invalid response"
    end

    %w(yes y).include?(response)
  end

  def reset_game
    system 'clear'
    player.hand.reset
    dealer.hand.reset
  end
end

play = Game.new
play.start
