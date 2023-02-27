=begin
Given a string that consists fo some words (all lowercased) and an assortment
of non_alphabetic characters, write a method that returns the string with all
of the non_alphabetic characters replaced by spaces. If one or more
non-alphabetic characters occur in a row, you should only have one space in the
result (no consecutive spaces).

input: string
output: string

explicit rules:
- no double+ spaces
- input will be an all lowercased string
implicit rules:
- leading and trailing spaces should not be trimmed

data structure:
- input is a string
- output is a string

algorithm:
- given input string 'words'
- substitute all non a-z chars in words with spaces
- trim double+ spaces to a single space
- return the new string
=end

def cleanup(words)
  words.gsub(/[^a-z]/, ' ').gsub(/\s+/, ' ')
end

puts cleanup("---what's my +*& line?") == ' what s my line '
