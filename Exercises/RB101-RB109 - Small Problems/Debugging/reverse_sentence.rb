def reverse_sentence(sentence)
  words = sentence.split(' ')
  reversed_words = []

  i = 0
  while i < words.length
    reversed_words.unshift(words[i])
    i += 1
  end

  reversed_words.join(' ')
end

p reverse_sentence('how are you doing')
# expected output: 'doing you are how'

# It doesn't work because you can't concatenate a string and an array together
# implicitly.
# Fixed by appending words[i] to the beginning of reversed words properly.
