print "What is the bill? "
bill = gets.chomp.to_f
print "What is the tip percentage? "
tip = gets.chomp.to_f/100
puts ""

puts "The tip is $#{bill*tip}"
puts "The total is $#{bill+bill*tip}"
