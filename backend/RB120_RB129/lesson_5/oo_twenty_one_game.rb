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

    face.each do |face|
      suits.each do |suit|
        cards << Card.new(suit, face)
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
    self.hand_total = value_of_face_cards + value_of_number_cards + value_of_ace
  end

  def reset
    @cards = []
    @hand_total = 0
  end
  private

  def value_of_face_cards
    10 * cards.count { |element| FACE_CARDS.include?(element) }
  end

  def value_of_number_cards
    value = 0
    cards.each do |element|
      value += element if element.is_a?(Integer)
    end
    value
  end
  
  def value_of_ace
    ace = 0
    if cards.include?("Ace")
      cards.count("Ace").times do
        if (value_of_face_cards + value_of_number_cards) + ace + 11 <= Game::TARGET
          ace += 11
        else
          ace += 1
        end
      end
    end
    ace
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
    game_rules
    set_contestant_name
    loop do
      deal_cards
      player_turn
      dealer_turn
      declare_winner
      break unless play_again?
      reset_game
    end
    display_goodbye_message
  end
  
  private

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

    player.bust if player.busted?
  end

  def dealer_turn
    puts ""
    puts "It's the dealer's turn..."

    until dealer.hand.hand_total >= LIMIT || dealer.busted? 
      sleep(2)
      puts ""
      puts "The dealer has decided to hit."
      dealer.hit(deck)
    end

    if dealer.busted?
      dealer.bust
    else
      dealer.stay
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
    if player.busted? && dealer.busted? == false
      puts "The winner is #{dealer.name}!"
    elsif dealer.busted? && player.busted? == false
      puts "The winner is #{player.name}!"
    elsif player.busted? && dealer.busted?
      puts "#{player.name} and #{dealer.name} went bust..you both lose!"
    end
  end

  def winner_no_bust
    if player.hand > dealer.hand
      puts "The winner is #{player.name}!"
    elsif dealer.hand > player.hand
      puts "The winner is #{dealer.name}!"
    elsif player.hand == dealer.hand
      puts "It's a tie!"
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
