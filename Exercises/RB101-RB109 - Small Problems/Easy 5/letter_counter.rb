=begin
Write a method that takes a string with one or more space separated words and
returns a hash that shows the number of words of different sizes.

input: string
output: hash

explicit rules:
- words consist of any string of charactesr that do not include a space
implicit rules:
- needs to handle empty strings

data structure:
- input is a string
- output is a hash

algorithm:
- given input string 'words'
- declare a hash sizes = {}
- split words by spaces
- for each word in split_words:
    if sizes[size of word] doesn't exist:
      create it and set it to 1
    else
      increase it by 1
- return sizes
=end

def word_sizes(words)
  sizes = {}

  words.split.each do |word|
    if sizes.has_key?(word.size)
      sizes[word.size] += 1
    else
      sizes[word.size] = 1
    end
  end

  sizes
end

p word_sizes('Four score and seven.')
p word_sizes('Hey diddle diddle, the cat and the fiddle!')
p word_sizes("What's up doc?")
p word_sizes('')
