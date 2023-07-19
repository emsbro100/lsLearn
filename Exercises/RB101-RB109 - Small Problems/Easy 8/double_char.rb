=begin
Write a method that takes a string, and returns a new string in which every
character is doubled

input: string
output: string

rules:
- must handle empty strings
- does not need to handle improper inputs

data structure:
- string as input
- string as output

algorithm:
repeater
========
- given input string 'str'
- create new string 'doubled'
- for each char in str:
  - add that char to doubled twice
- return doubled
=end

def repeater(str)
  doubled = ''
  str.chars.each { |char| doubled += char + char }
  doubled
end

p repeater('Hello') == "HHeelllloo"
p repeater("Good job!") == "GGoooodd  jjoobb!!"
p repeater('') == ''
