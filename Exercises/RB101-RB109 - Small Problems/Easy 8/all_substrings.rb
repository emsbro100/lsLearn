=begin
Write a method that returns a list of all substrings of a string. The returned
list should be ordered by where in the string the substring begins. This means
all substrings that start at position 0 should come first, then all substrings
that start at position 1, and so on. Since multiple substrings will occur
at each position, the substrings at a given position should be returned in order
from shortest to longest.

input: string
output: array

rules:
- you should use the leading_substrings method from the previous exercise
- does not need to handle improper inputs

data structure:
- string as input
- array as output

algorithm:
leading_substrings
==================
- given input string 'str'
- create new array 'substrings'
- for each number from 1 to the lenght of substrings (n):
  - slice from str starting at index 0 with a length of n
  - add that slice to substrings
- sort substrings by size
- return substrings

substrings
==========
- given input string 'str'
- create new array 'substrings'
- for each index in str (i):
  - slice a new substring from str from i to the end of str
  - run leading_substrings on that substring, add the return value to substrings
- return substrings
=end

def leading_substrings(str)
  substrings = []
  (1..str.size).each { |n| substrings.push(str.slice(0, n)) }
  substrings.sort
end

def substrings(str)
  substrings = []
  str.size.times { |i| substrings += leading_substrings(str[i..]) }
  substrings
end

p substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]
