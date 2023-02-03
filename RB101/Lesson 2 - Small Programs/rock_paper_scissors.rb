CHOICES = %w(rock paper scissors lizard spock)
WIN_CONDITIONS = {
  "rock" => %w(scissors lizard),
  "paper" => %w(rock spock),
  "scissors" => %w(paper lizard),
  "spock" => %w(scissors rock),
  "lizard" => %w(spock paper)
}

def prompt(message)
  puts "=> #{message}"
end

def winner(first, second)
  return "tie" if first == second
  WIN_CONDITIONS[first].include?(second) ? first : second
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
  loop do
    prompt("Choose one: #{CHOICES.join(', ')}")
    choice = gets.chomp.downcase

    if choice == 's'
      puts "Did you mean 'scissors' (sc) or 'spock' (sp)?"
      next
    elsif choice != ''
      CHOICES.each { |option| return option if option =~ Regexp.new(choice) }
    end

    prompt("Invalid choice!")
  end
end

def get_answer?(text)
  puts "#{text} (y/n)"
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
  scores = { player: 0, computer: 0 }

  loop do
    choice = get_choice
    computer_choice = CHOICES.sample
    prompt("You chose #{choice}, computer chose #{computer_choice}.")

    case winner(choice, computer_choice)
    when choice
      scores[:player] += 1
    when computer_choice
      scores[:computer] += 1
    end

    display_results(choice, computer_choice)
    puts " [PLAYER: #{scores[:player]} | COMPUTER: #{scores[:computer]}]"

    break if scores[:player] == 3 || scores[:computer] == 3
  end

  if scores[:player] == 3
    prompt("You were the first to achieve a score of 3! Good job!")
  else
    prompt("The computer was the first to achieve a score of 3! Nice Try!")
  end

  break unless get_answer?("Do you want to play again?")
end

puts "Goodbye, thanks for playing!"
