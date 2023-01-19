numerator = ''
denominator = ''

def valid_number?(number_string)
  number_string.to_i.to_s == number_string
end

loop do
  puts ">> Please enter the numerator:"
  numerator = gets.chomp
  break if valid_number?(numerator)
  puts ">> Invalid input. Please enter an integer."
end
loop do
  puts ">> Please enter the denominator:"
  denominator = gets.chomp
  if valid_number?(denominator)
    if denominator.to_i == 0
      puts ">> Invalid input. A denominator of 0 is not allowed."
      next
    else
      break
    end
  end
  puts ">> Invalid input. Please enter an integer."
end
puts ">> #{numerator} / #{denominator} is #{numerator.to_i / denominator.to_i}"