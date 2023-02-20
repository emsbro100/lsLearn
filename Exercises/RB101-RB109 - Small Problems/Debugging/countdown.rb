def decrease(counter)
  counter - 1
end

counter = 10

counter.times do
  puts counter
  counter = decrease(counter)
end

puts 'LAUNCH!'

# It isn't working properly because the decrease method is non-mutating
# so the counter isn't actually decreased.
# This can be fixed by just assigning counter to the return value of decrease.
