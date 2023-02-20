def neutralize(sentence)
  words = sentence.split(' ')
  words.clone.each do |word|
    words.delete(word) if negative?(word)
  end

  words.join(' ')
end

def negative?(word)
  [ 'dull',
    'boring',
    'annoying',
    'chaotic'
  ].include?(word)
end

puts neutralize('These dull boring cards are part of a chaotic board game.')
# Expected: These cards are part of a board game.
# Actual: These boring cards are part of a board game.

# It doesn't work because modifying an array while iterating through it will
# throw off the indexes.
# This is fixed by iterating through a clone of the array.
