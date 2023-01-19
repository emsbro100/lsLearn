loop do
  puts "Do you want me to print something?"
  input = gets.chomp.downcase
  if input == 'y'
    puts "something"
    break
  elsif input == 'n'
    break
  else
    puts "Invalid input, please respond with y or n."
  end
end