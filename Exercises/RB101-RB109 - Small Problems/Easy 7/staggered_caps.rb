=begin
Write a method that takes a String as an argument, and returns a new String that
contains the original value using a staggered capitalization scheme in which
every other character is capitalized, and the remaining characters are
lowercase. Characters that are not letters should not be changed, but count as
characters when switching between upper and lowercase.

input: string
output: string

rules:
- count every other character, including non-letters
- do not modify non-letters
- does not need to handle improper inputs

data structure:
- string as input
- string as output

algorithm:
staggered_case
==============
- given input string 'str'
- split str by char into new array chars, make all letters lowercase
- for each character in chars
  - if character's index is even make it uppercase
- join chars into new string 'staggered_str'
- return staggered_str
=end

def staggered_case(str)
  chars = str.downcase.chars
  chars.each_with_index { |char, idx| char.upcase! if idx.even? }
  staggered_str = chars.join
end

p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'
