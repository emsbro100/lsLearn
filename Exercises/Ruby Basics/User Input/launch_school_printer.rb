printed = 0
times = 0

loop do
  puts "How many times should this program print? Please enter a value of at least 3:"
  times = gets.chomp.to_i
  if times < 3
    puts "That's not enough lines."
    next
  end
  break
end

until printed == times
  puts "Launch School is the best!"
  printed += 1
end