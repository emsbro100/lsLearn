lines = nil

loop do
  puts "How many times should this program print? Please enter a value of at least 3 (q to quit)"
  lines = gets.chomp
  break if lines.downcase == 'q'
  lines = lines.to_i
  if lines < 3
    puts "That's not enough lines."
    next
  end
  while lines > 0
    puts "Launch School is the best!"
    lines -= 1
  end
end

