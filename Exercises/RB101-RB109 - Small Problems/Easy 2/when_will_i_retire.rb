YEAR = Time.now.year

print "What is your age? "
age = gets.chomp.to_i
print "At what age would you like to retire? "
retiring_age = gets.chomp.to_i

years_left = retiring_age - age

puts
puts "It's #{YEAR}. You will retire in #{YEAR + years_left}."
puts "You have only #{years_left} years of work to go!"
