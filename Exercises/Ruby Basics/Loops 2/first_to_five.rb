number_a = 0
number_b = 0

loop do
  number_a += rand(2)
  number_b += rand(2)
  next if number_a < 5 && number_b < 5 # use unless/or instead of if/and next time, brings evaulations down to a min of 1 instead of min of 2
  puts "5 was reached!"
  break
end