=begin
Given a string of words separated by spaces, write a method that takes this
string of words and returns a string in which the first and last letters of
every word are swapped.

input: string
output: string

explicit rules:
- every word contains at least one letter
- every string wil always contain at least one word
- each string contains nothign but word and spaces

data structure:
- input is a string of words
- output is a string of words
- use an array to split and modify the words

algorithm:
- given input 'words'
- split words
- assign the first and last letter of each word to the other
- join words array and return it as a string
=end

def swap(words)
  words_arr = words.split(' ')
  words_arr.each { |word| word[0], word[-1] = word[-1], word[0] }
  words_arr.join(' ')
end

p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap('Abcde') == 'ebcdA'
p swap('a') == 'a'
