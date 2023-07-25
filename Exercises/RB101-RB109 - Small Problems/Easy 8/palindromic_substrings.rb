=begin
Write a method that returns a list of all substrings of a string that are
palindromic. That is, each substring must consist of the same sequence of
characters forwards as it does backwards. The return value should be arranged in
the same sequence as the substrings appear in the string. Duplicate palindromes
should be included multiple times.

input: string
output: array

rules:
- include duplicate palindromes in the output array
- does not need to handle improper inputs
- should be arranged in the order substrings appear in the string

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

palindrome?
===========
- given input string 'str'
- create new integer 'half', assign it to the size of string / 2 rounded up
- slice substring of str from index of half to the end of the string, assign
  that to a new string 'end_half'
- slice substring of str from index 0 to the size of string / 2 (exclusive),
  assign that to a new string 'start_half'
- check whether start_half is the same as end_half reversed, return the result

palindromes
===========
- given input string 'str'
- run substrings on str and assign the returned value to 
  'palindromic_substrings'
- remove all strings from substrings that do not return true when passed through
  palindrome?
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

def palindrome?(str)
  half = (str.size / 2.0).round

  end_half = str[half..]
  start_half = str[...(str.size / 2)]

  start_half == end_half.reverse
end

def palindromes(str)
  palindromic_substrings = substrings(str)
  palindromic_substrings.select { |str| palindrome?(str) && str.size > 1 }
end

p palindromes('abcd') == []
p palindromes('madam') == ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
p palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]
