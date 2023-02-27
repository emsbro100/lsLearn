=begin
Modify the `word_sizes` method from the previous exercise to exclude non-letters
when determining word size

input: string
output: hash

data structure:
- input is a string of words
- output is a hash

algorithm:
- given input string 'words'
- split words by spaces
- for each word in split_words:
    remove all non-letter chars from word
    if sizes[size of word] doesn't exist:
      create it and set it to 1
    else
      increase it by 1
- return sizes
=end

def word_sizes(words)
  sizes = {}

  words.split.each do |word|
    word = word.gsub(/[^a-zA-Z]/, '')
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
