=begin
Write a method that takes a string, and returns a new string in which every
consonant character is doubled. Vowels, digits, punctuation, and whitespace
should not be included.

input: string
output: string

rules:
- do not include vowels, digits, punctuation, or whitespace
- does not need to handle improper inputs
- must handle empty strings

data structure:
- string as input
- string as output

algorithm:
double_consonants
=================
- given input string 'str'
- create new string 'doubled'
- for each char in str:
  - add that char to doubled twice, unless it is a vowel, digit, punctuation, or
    whitespace
- return doubled
=end

def double_consonants(str)
  doubled = ''
  str.chars.each do |char|
    char =~ /[bcdfghjklmnpqrstvwxyz]/i ? doubled += char + char 
                                               : doubled += char 
  end
  doubled
end

p double_consonants('String') == "SSttrrinngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""
