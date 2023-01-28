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
      if conditions[0] == first
        return first
      else
        return second
      end
    end
  end
end

def display_results(player, computer)
  case winner(player, computer)
  when player
    prompt("You won!")
  when computer
    prompt("You lost!")
  else
    prompt("It's a tie!")
  end
end

def get_choice
  choice = ''
  loop do
    prompt("Choose one: #{CHOICES.join(', ')}")
    choice = gets.chomp.downcase

    CHOICES.each do |option|
      if option =~ Regexp.new(choice)
        return option
      end
    end

    prompt("Invalid choice!")
  end
end

loop do
  prompt("Rock paper scissors! First to three points wins is the grand winner.")
  player_score = 0
  computer_score = 0

  loop do
    choice = get_choice
    computer_choice = CHOICES.sample
    prompt("You chose #{choice}, computer chose #{computer_choice}.")

    display_results(choice, computer_choice)
    case winner(choice, computer_choice)
    when choice
      player_score += 1
    when computer_choice
      computer_score += 1
    end
    puts ""

    break if player_score == 3 || computer_score == 3
  end

  if player_score == 3
    prompt("You were the first to achieve a score of 3! Good job!")
  else
    prompt("The computer was the first to achieve a score of 3! Nice Try!")
  end

  prompt("Do you want to play again? (y/n)")
  play_again = gets.chomp.downcase
  break unless play_again.start_with?('y')
end
