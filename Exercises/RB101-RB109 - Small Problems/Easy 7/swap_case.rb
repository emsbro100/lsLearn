=begin
Write a method that takes a string as an argument and returns a new string in
which every uppercase letter is replaced by its lowercase version, and every
lowercase letter by its uppercase version. All other characters should be
unchanged.

input: string
output: string

rules:
- do not change any char that isnt a letter
- does not need to handle improper inputs

data structure:
- string as input
- array to store chars
- string as output

algorithm:
swapcase
========
- given input string 'str'
- split str by each char to array 'chars'
- for each char in chars
  - if char is a lowercase letter (a-z) make it uppercase
  - if char is an uppercase letter (A-Z) make it lowercase
- join chars to new string 'swapped_str'
- return swapped_str
=end

def swapcase(str)
  chars = str.chars
  chars.map! do |char|
    if char =~ /[a-z]/ then char.upcase
    elsif char =~ /[A-Z]/ then char.downcase
    else char
    end
  end
  swapped_str = chars.join
end

p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'
