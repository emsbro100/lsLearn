=begin
Write a program that prints out groups of words that are anagrams from an array.

rules:
- anagrams are words that have the same exact letters in them but in a
  different order.
- output should have an array for each group of anagrams, printed to the console

data structure:
- array as input
- arrays as outputs
- arrays to store chars

algorithm
print_anagrams
=====
- given input array 'words'
- group the words in words by all of their characters split up and sorted,
  assign the groups array to 'groups'
- print each group in groups
=end

def print_anagrams(words)
  groups = words.group_by { |word| word.chars.sort }
  groups.each { |group| p group[1] }
end

words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']

print_anagrams(words)
