# 1. Create a String
my_string = "Hello!"

# 2. Quote Confusion
puts "It's now 12 o'clock."

# 3. Ignoring Case
name = 'Roger'
puts name.downcase == 'RoGeR'.downcase
puts name.downcase == 'DAVE'.downcase

# 4. Dynamic String
name = 'Elizabeth'

puts "Hello, #{name}!"

# 5. Combining Names
first_name = 'John'
last_name = 'Doe'
puts full_name = "#{first_name} #{last_name}"

# 6. Tricky Formatting
state = 'tExAs'
state.capitalize!
puts state

# 7. Goodbye, not Hello
greeting = 'Hello!'
greeting.replace("Goodbye!")
puts greeting

# 8. Print the Alphabet
alphabet = 'abcdefghijklmnopqrstuvwxyz'
puts alphabet.split('')

# 9. Pluralize
words = 'car human elephant airplane'
wordlist = words.split
wordlist.each { |word| puts "#{word}s"}

# 10. Are You There?
colors = 'blue pink yellow orange'
puts colors.include?('yellow')
puts colors.include?('purple')