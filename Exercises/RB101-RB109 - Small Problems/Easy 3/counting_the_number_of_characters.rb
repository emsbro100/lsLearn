print "Please write a word or multiple words: "
words = gets.chomp
puts "There are #{words.gsub(' ', '').length} characters in \"#{words}\""
