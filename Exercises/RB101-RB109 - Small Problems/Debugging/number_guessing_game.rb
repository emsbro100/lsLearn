def valid_integer?(string)
  string.to_i.to_s == string
end

def guess_number(max_number, max_attempts)
  winning_number = (1..max_number).to_a.sample
  attempts = 0

  loop do
    attempts += 1
    break if attempts > max_attempts

    input = nil
    until valid_integer?(input)
      print 'Make a guess: '
      input = gets.chomp
    end

    guess = input.to_i

    if guess == winning_number
      puts 'Yes! You win.'
      break
    else
      puts 'Nope. Too small.' if guess < winning_number
      puts 'Nope. Too big.'   if guess > winning_number
    end
  end
end

guess_number(10, 10)

# The reason it didn't work is because it was already within a program loop,
# but at the end of that loop it was calling guess_number again and resetting
# the whole program.
# It's fixed by simply deleting the recursive call.
# The program also continues getting guesses after guessing correctly, this can
# be fixed by adding break after line 22.
