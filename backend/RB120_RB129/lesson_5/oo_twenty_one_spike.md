## Game description
Twenty-One is a card game consisting of a dealer and a player.
Participants try to get as close as possible to 21 without going over.

**Overview of the game:**
* Both participants are initially dealt 2 cards from a 52-card deck.
* The player takes the first turn - they can 'hit' or 'stay'.
* If the player busts, they lose. If they stay, it's the dealer's turn.
* The dealer must hit until their cards add up to at least 17.
* If the dealer busts, the player wins.
* If both the player and dealer stay then the highest total wins.
* If both totals are equal, then it's a tie and nobody wins.

**Nouns and verbs:**

Nouns: card, player, dealer, participant, deck, game, total

Verbs: deal, hit, stay, busts

'Total' has been listed as a noun but you wouldn't create a `Total` class, rather is an attribute within another class. It could be described as a verb: 'calculate_total'.

Also, 'busts' isn't an action either participant is performing, rather it's a state.

**Organising the nouns into classes:**
```
Player
- hit
- stay
- busted?
- total
Dealer
- hit
- stay
- busted?
- total
- deal (here or in Deck?)
Participant
Deck
- deal (here or in Dealer?)
Card
Game
- start
```
There's alot of redundancy in the `Player` and `Dealer` class. This could be extracted to a `Participant` super-class? LS uses a module called `Hand`.

**Spike**
```ruby
class Participant
  def initialize
    # what 'states' will be associated with each participant? 
    # the card hand?
  end

  def hit
  end

  def stay
  end

  def busted
  end

  def total
    # needs to know about "cards" to calculate this
  end
end

class Dealer < Participant
end

class Player < Participant
end

class Deck
  def initialize
    # deck should contain Card class objects
    # need a data strcuture to keep track of cards
    # maybe an Array?
  end
  
  def deal
    # dealing cards feels like it should be a Deck behaviour
  end
end

class Card
  def initialize
    # what are the 'states' of a card?
    # states = suit and face value
  end
end

class Game
  def start
    # game orchestration method
  end
end

Game.new.start
```

**Plan the `Game#start` method**
```ruby
class Game
  def start
    deal_cards
    show_initial_cards
    player_turn
    dealer_turn
    show_result
  end
end
```
