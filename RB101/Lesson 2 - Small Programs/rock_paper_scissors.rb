CHOICES = %w(rock paper scissors lizard spock)
WIN_CONDITIONS = [%w(paper rock), %w(rock scissors), %w(scissors paper),
                  %w(spock rock), %w(paper spock), %w(spock scissors),
                  %w(lizard paper), %w(rock lizard), %w(scissors lizard),
                  %w(lizard spock)]

def prompt(message)
  puts "=> #{message}"
end

def winner(first, second)
  if first == second
    return "tie"
  end
  WIN_CONDITIONS.each do |conditions|
    if conditions.include?(first) && conditions.include?(second)
      return conditions[0] == first ? first : second 
    end
  end
end

def display_results(player, computer)
  case winner(player, computer)
  when player
    print("You won!")
  when computer
    print("You lost!")
  else
    print("It's a tie!")
  end
end

def get_choice
  choice = ''
  loop do
    prompt("Choose one: #{CHOICES.join(', ')}")
    choice = gets.chomp.downcase

    if choice == 's'
      puts "Did you mean 'scissors' (sc) or 'spock' (sp)?"
      next
    end

    CHOICES.each do |option|
      if option =~ Regexp.new(choice)
        return option
      end
    end

    prompt("Invalid choice!")
  end
end

def get_answer?(text)
  print text
  puts " (y/n)"
  choice = gets.chomp.downcase
  if choice.start_with?('y')
    true
  else
    false
  end
end

puts "Welcome to RPSSL! (Rock Paper Scissors Spock Lizard)"
if get_answer?("Would you like to read the rules?")
  puts "Normal RPS rules apply, with the addition of Lizard and Spock:\n"\
       " Scissors cuts Paper covers Rock crushes\n"\
       " Lizard poisons Spock smashes Scissors\n"\
       " decapitates Lizard eats Paper disproves\n"\
       " Spock vaporizes Rock crushes Scissors."
end
loop do
  puts "Begin! First to three points is the grand winner."
  player_score = 0
  computer_score = 0

  loop do
    choice = get_choice
    computer_choice = CHOICES.sample
    prompt("You chose #{choice}, computer chose #{computer_choice}.")

    case winner(choice, computer_choice)
    when choice
      player_score += 1
    when computer_choice
      computer_score += 1
    end

    display_results(choice, computer_choice)
    puts " [PLAYER: #{player_score} | COMPUTER: #{computer_score}]"

    break if player_score == 3 || computer_score == 3
  end

  if player_score == 3
    prompt("You were the first to achieve a score of 3! Good job!")
  else
    prompt("The computer was the first to achieve a score of 3! Nice Try!")
  end

  break unless get_answer?("Do you want to play again?")
end
puts "Goodbye, thanks for playing!"

=begin
Things to work on:
- DONE: Require an explicit choice from user for "s", rather than defaulting to scissors.
- DONE: Add a scoreboard so that user can tell the score
- DONE: Give more info to the user in general, such as a welcome/goodbye message or displaying rules.

- Work on the spacing to make the code more readable, remember to divide it by function sections.
  - Concrete example: the case statement from 64-69 should have a blank line before and after,
    so it doesn't look intertwined with display_results.
- Extract more methods
  - DONE: Example: extract a method for play again (break unless play_again?)

- The winner method is quite complex, think about another way to figure out the winner and consider the tradeoffs.
- Work through other sections of the code and consider other possible solutions/tradeoffs. 
  - Example: get_choice method
=end
