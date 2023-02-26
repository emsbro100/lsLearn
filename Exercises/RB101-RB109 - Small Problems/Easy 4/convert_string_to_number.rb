=begin
Take a string of numbers as an input and covert them to an equivalent integer
number without using any of the built-in methods such as String#to_i or
Integer().

input: string
output: integer

explicit rules:
- can't use built in methods
- it should calculate the result by analyzing the characters in the string
- there won't be any leading + or - signs
- all characters will be numeric

data structure:
- input is a string of numbers
- output is the integer representation of the input string
- use ascii character values for checking values of string chars
- use an array to assemble the final integer's value

algorithm:
- given input `number_string`
- for each character in the string:
    convert the character to ascii value
    check a dictionary to see the integer for that ascii value
    append the integer for that ascii value to the integer array
- for each number in the integer array, add that to an integer * 10^[digit]
- return the integer
=end

def string_to_integer(number_string)
  integers = []
  integer = 0
  number_chars = number_string.split('')

  number_chars.each { |char| integers << (char.ord - 48) }

  integers.each_with_index do |num, idx|
    place_multiplier = 10.pow(integers.size - idx - 1)
    integer += num * place_multiplier
  end

  integer
end

puts string_to_integer('8237') == 8237
