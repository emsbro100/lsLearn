=begin
Write a method that takes one argument, a string containing one or more words,
and returns the given string with words that contain five or more characters
reversed. Each string will consist of only letters and spaces. Spaces should be
included only when more than one word is present.

input: string
output: string

rules:
- input will contain one or more words
- input will only contain letters and spaces
- spaces should only be included when more than one word is present

data structure:
- string as input
- string as output
- array to store words

algorithm:
reverse_5_letter!
=================
- given input string 'word'
- if word has 5 or more chars, reverse it
- otherwise, do nothing

reverse_words
=============
- given input string 'str'
- split str by space to new array 'words'
- if words only has one element:
  - remove spaces from the element, pass it through reverse_5_letter
  - return the element
- else:
  - for each element, pass it through reverse_5_letter
  - join all elements by space to a new string 'reversed'
  - return 'reversed'
=end

def reverse_5_letter!(word)
  word.reverse! if word.size >= 5
end

def reverse_words(str)
  words = str.split(' ')
  if words.size == 1
    words[0].gsub!(' ', '')
    reverse_5_letter!(words[0])
    return words[0]
  else
    words.each { |word| reverse_5_letter!(word) }
    return words.join(' ')
  end
end

puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS
