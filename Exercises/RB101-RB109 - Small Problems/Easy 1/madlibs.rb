def madlib
  puts "Please enter a noun:"
  noun = gets.chomp
  puts "Please enter a verb:"
  verb = gets.chomp
  puts "Please enter an adjective:"
  adjective = gets.chomp
  puts "Please enter an adverb:"
  adverb = gets.chomp
  puts "They've been saying you should NEVER #{verb} a #{adjective} #{noun} #{adverb}!"
end

madlib()
