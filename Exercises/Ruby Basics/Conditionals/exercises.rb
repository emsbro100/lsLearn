# 1. Unpredictable Weather (Part 1)
sun = ['visible', 'hidden'].sample
puts "The sun is so bright!" if sun == 'visible'

# 2. Unpredictable Weather (Part 2)
sun = ['visible', 'hidden'].sample
puts "The clouds are blocking the sun!" unless sun == 'visible'

# 3. Unpredictable Weather (Part 3)
sun = ['visible', 'hidden'].sample
puts "The sun is so bright!" if sun == 'visible'
puts "The clouds are blocking the sun!" unless sun == 'visible'

# 4. True or False
boolean = [true, false].sample
puts boolean ? "I'm true!" : "I'm false!"

# 5. Truthy Number
# It will print "My favorite number is 7."

# 6. Stoplight (Part 1)
stoplight = ['green', 'yellow', 'red'].sample
case stoplight
when 'green'
  puts "Go!"
when 'yellow'
  puts "Slow down!"
when 'red'
  puts "Stop!"
end

# 7. Stoplight (Part 2)
stoplight = ['green', 'yellow', 'red'].sample
if stoplight == 'green'
  puts 'Go!'
elsif stoplight == 'yellow'
  puts 'Slow down!'
else
  puts 'Stop!'
end

# 8. Sleep Alert
status = ['awake', 'tired'].sample
what_to_do = if status == 'awake'
  "Be productive!"
else
  "Go to sleep!"
end
puts what_to_do

# 9. Cool Numbers
number = rand(10)

if number == 5
  puts '5 is a cool number!'
else
  puts 'Other numbers are cool too!'
end

# 10. Stoplight (Part 3)
stoplight = ['green', 'yellow', 'red'].sample

case stoplight
when 'green' then puts 'Go!'
when 'yellow' then puts 'Slow down!'
else puts 'Stop!'
end