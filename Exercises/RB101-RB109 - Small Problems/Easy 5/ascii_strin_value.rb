=begin
Write a method that determines and returns the ASCII string value of a string
that is passed in as an argumnet. The ASCII string value is the sum of the ASCII
values of every character in the string.

input: string
output: integer

explicit rules:
- you may use String#ord
implicit rules:
- must handle empty strings

data structure:
- input is a string
- output is an integer 
- use an integer to store the sum of the ASCII values

algorithm:
- given input str
- separate str into characters
- check the ascii value of each char and add it to sum
- return sum
=end

def ascii_value(str)
  sum = 0
  str.chars.each do |char|
    sum += char.ord
  end
  sum
end

p ascii_value('Four score') == 984
p ascii_value('Launch School') == 1251
p ascii_value('a') == 97
p ascii_value('') == 0
