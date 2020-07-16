# OOP approach to designing TTT game

## Initial steps
1. Write a description of the problem and extract major nouns and verbs
2. Make an initial guess at organizing the verbs into nouns and do a spike to explore the problem with temporary code

## Description of the game
Tic Tac Toe is a two player board game played on a 3x3 grid. Players take turns marking a square. The first player to mark three squares in a row wins.

## Nouns and verbs
Nouns: board, player, square, grid
Verbs: play, mark

Organizing the verbs into the nouns:

- Board
- Square
- Player
  - mark
  - play

## Spike
Write the nouns out as classes and create the constrcutor method for each class. Think about possible states for the class objects.
```ruby
class Board
  def initialize
    # how should the 3x3 grid be modelled? Maybe 'squares'?
    # what data structure should we use?
    # - array/hash of Square objects?
    # - array/hash of strings or integers?
  end
end

class Square
  def initialize
    # maybe a 'status' to keep track of this square's mark?
  end
end

class Player
  def initialize
    # maybe a 'marker' to keep track of this player's symbol(X or O)?
  end

  def mark

  end

  def play

  end
end
```
We also need an 'orchestration engine' that controls the game play.
```ruby
class TTTGame
  def play

  end
end

game = TTTGame.new
game.play
```

From the code above it looks like we should remove the `Player#play` method.

We can flesh out the sequence of the `TTTGame#play` method by invoking the methods we wish existed.

```ruby
class TTTGame
  def play
    display_welcome_message
    
    loop do
      display_board
      first_player_moves
      break if someone_won? || board_full?

      second_player_moves
      break if someone_won? || board_full?
    end

    display_result
    display_goodbye_message
  end
end
```
This provides scaffolding code so we can now start exploring deeper.
