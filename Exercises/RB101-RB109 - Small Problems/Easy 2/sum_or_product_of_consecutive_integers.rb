number = 0
input = ''

loop do
  puts ">> Please enter an integer greater than 0:"
  number = gets.chomp
  if number =~ /\D/ || number.to_i < 1
    puts ">> Invalid input!"
  else
    number = number.to_i
    break
  end
end

loop do
  puts ">> Enter 's' to compute the sum, or 'p' to compute the product."
  input = gets.chomp
  if input == 's' || input == 'p'
    break
  end
  puts ">> Invalid input!"
end

if input == 's'
  puts "The sum of the integers between 1 and #{number} is #{(1..number).reduce(:+)}."
else
  puts "The product of the integers between 1 and #{number} is #{(1..number).reduce(:*)}."
end
