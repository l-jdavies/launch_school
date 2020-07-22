require 'byebug'
module DisplayMessages
  def display_card_hand(individual)
    puts ""
    puts "#{individual.name}'s cards are: #{joinand(individual.hand.cards)}."
  end

  def display_hit_or_stay_message
    response = nil
    loop do
      puts ""
      puts "Would you like to 'hit' or 'stay'?"
      puts "Please enter your move:"
      response = gets.chomp.downcase
      break if response == 'hit' || response == 'stay'
      puts "Invalid response."
    end
    response
  end
end

class Card
  def initialize(suit, face)
    @suit = suit
    @face_value = face
  end
end

class Deck
  FACE_CARDS = %w(Jack Queen King)
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

  def initialize
    @cards = []
    @hand_total = 0
  end

  def update_value_of_hand
    byebug
    @hand_total = value_of_face_cards + value_of_number_cards + value_of_ace
  end

  def value_of_face_cards
    10 * cards.count { |element| Deck::FACE_CARDS.include?(element) }
  end

  def value_of_number_cards
    value = 0
    cards.each do |element|
      value += element if element.is_a?(Integer)
    end
    value
  end
end

class Participant
  attr_accessor :hand
  attr_reader :name
  
  def initialize
    @hand = Hand.new
  end

  def add_card
    hand.cards
  end

  def hit!(deck)
    add_card << deck.deal
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
end

class Dealer < Participant
  def set_name
    @name = ['R2D2', 'Bob the computer', 'Mac'].sample
  end
end

class Game
  include DisplayMessages

  attr_accessor :player, :dealer, :deck 
  
  def initialize
    @player = Player.new
    @dealer = Dealer.new
    @deck = Deck.new
  end

  def start
    player.set_name
    dealer.set_name
    deal_cards
    display_card_hand(player)
    display_card_hand(dealer)
    player_turn
  end
  
  def joinand(arr, delimiter=', ', word='and')
    case arr.size
    when 0 then ''
    when 1 then arr.first
    when 2 then arr.join(" #{word} ")
    else
      arr[-1] = "#{word} #{arr.last}"
      arr.join(delimiter)
    end
  end

  private

  def deal_cards
    2.times do |_|
      player.hit!(deck)
      dealer.hit!(deck)
    end
  end

  def player_turn
    answer = nil

    loop do
      answer = display_hit_or_stay_message
      if answer == 'hit'
        player.hit!(deck)
        player.hand.update_value_of_hand
        response
        break
      end
    end
  end
end

play = Game.new
play.start
