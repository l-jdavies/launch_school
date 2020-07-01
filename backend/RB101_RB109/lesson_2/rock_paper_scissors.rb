# Following video walk through
# Build Rock Paper Scissors game
# User makes a choice
# Computer makes a choice
# Winner is displayed

VALID_CHOICES = ['rock', 'paper', 'scissors']

def win?(first, second)
  (first == 'rock' && second == 'scissors') || \
    (first == 'paper' && second == 'rock') || \
    (first == 'scissors' && second == 'paper')
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("You won!")
  elsif win?(computer, player)
    prompt("Computer won!")
  else
    prompt("It's a tie")
  end
end

def prompt(message)
  puts("=> #{message}")
end

loop do
  choice = ''
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = gets.chomp
    if VALID_CHOICES.include?(choice)
      break
    else prompt("That's not a valid choice.")
    end
  end

  computer_choice = VALID_CHOICES.sample

  puts "You chose #{choice} and the computer chose #{computer_choice}"

  display_results(choice, computer_choice)

  prompt("Do you want to play again? Press 'Y' to replay")
  answer = gets.chomp
  break unless answer.downcase == 'y'
end

prompt("Thankyou for playing. Goodbye")
