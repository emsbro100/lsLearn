=begin
Write a method that returns a list of all substrings of a sring that start at
the beginning of the original string. The return value hsould be arranged in
order from shortest to longest substring.

input: string
output: array

rules:
- output array should be sorted by element size
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
=end

def leading_substrings(str)
  substrings = []
  (1..str.size).each { |n| substrings.push(str.slice(0, n)) }
  substrings.sort
end

p leading_substrings('abc') == ['a', 'ab', 'abc']
p leading_substrings('a') == ['a']
p leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']
