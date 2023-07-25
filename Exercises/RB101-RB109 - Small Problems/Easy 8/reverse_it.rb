=begin
Write a method that takes one argument, a string, and returns a new string with
the worrds in reverse order.

input: string
output: string

rules:
- must handle empty strings
- must trim whitespace
- does not need to handle improper inputs

data structure:
- string as input
- array to store words
- string as output

algorithm:
reverse_sentence
================
- given input string 'str'
- split str by space to new array 'words'
- reverse words, remove any entries that are just spaces
- join words to new string 'reversed_str'
- return reversed_str
=end

def reverse_sentence(str)
  words = str.split(' ')
  words.reverse!.select! { |word| word =~ /\S/ }
  words.join(' ')
end

puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'
puts reverse_sentence('') == ''
puts reverse_sentence('    ') == '' # Any number of spaces results in ''
