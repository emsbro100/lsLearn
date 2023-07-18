=begin
Write a method that takes a single String argument and returns a new string that
contains the original value of the argument with the first character of every
word capitalized and all other letters lowercase.

input: string
output: string

rules:
- does not need to handle improper inputs

data structure:
- string as input
- string as output
- array to store words

algorithm:
word_cap
========
- given input 'str'
- split str by space into new array 'words'
- for each word in words, force downcase then capitalize the word
- join words by space into new string 'words_capitalized'
- return words_capitalized
=end

def word_cap(str)
  words = str.split(' ')
  words.map! { |word| word.downcase.capitalize }
  words_capitalized = words.join(' ')
end

p word_cap('four score and seven') == 'Four Score And Seven'
p word_cap('the javaScript language') == 'The Javascript Language'
p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'
