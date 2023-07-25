=begin
Write a method that takes a string as an argumnet, and returns an Array that
contains every word from the string, to which you have appended a space and the
word length.

input: string
output: array

rules:
- words in the string are separated by exactly one space
- any substring of non-space chars is a word
- input will only be a string
- input may be an empty string

data structure:
- string as input
- array as output

algorithm:
word_lengths
============
- given input string 'str'
- split str by spaces, assign that to a new array 'words'
- for each word in words:
  - append a space and the length of the word to the word
- return words
=end

def word_lengths(str)
  words = str.split(' ')
  words.map { |word| "#{word} #{word.size}" }
end

p word_lengths("cow sheep chicken") == ["cow 3", "sheep 5", "chicken 7"]

p word_lengths("baseball hot dogs and apple pie") ==
  ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]

p word_lengths("It ain't easy, is it?") == ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]

p word_lengths("Supercalifragilisticexpialidocious") ==
  ["Supercalifragilisticexpialidocious 34"]

p word_lengths("") == []
