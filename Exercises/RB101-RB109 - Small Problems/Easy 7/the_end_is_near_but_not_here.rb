=begin
Write a method that returns the next to alst word in the String passed to it as
an argument.

input: string
output: string

rules:
- words are any sequence of non-blank characters
- input string will always contain at least two words

data structure:
- string as input
- string as output

algorithm:
penultimate
===========
- given input string 'words'
- split words by space into new array 'words_split'
- return the second to last string in words_split
=end

def penultimate(words)
  words_split = words.split(' ')
  words_split[-2]
end

p penultimate('last word') == 'last'
p penultimate('Launch School is great!') == 'is'
