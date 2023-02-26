=begin
Write a method to convert a string with a signed integer (-, +, or no sign) to
an actual signed integer. You can use the method from the previous exercise.

input: string
output: integer

explicit rules:
- can use string_to_integer method from previous exercise
- string will only contain a sign at the front and digits

data structure:
- input is a signed integer represented as a string
- output is a signed integer represented as an integer
- use a boolean to store whether integer will be negative

algorithm:
- given the argument `number_string`
- check if the first char is a + or -
- if it is, then change the `negative` boolean appropriately and pass the rest
  of the string to string_to_integer
- otherwise, simply pass the string to string_to_integer
- make the returned string negative if it should be, then return it
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

def string_to_signed_integer(number_string)
  negative = false

  if ['+', '-'].include?(number_string[0])
    integer = string_to_integer(number_string[1..])
    negative = true if number_string[0] == '-'
  else
    integer = string_to_integer(number_string)
  end

  integer = negative ? (-integer) : integer
end

p string_to_signed_integer('4321') == 4321
p string_to_signed_integer('-570') == -570
p string_to_signed_integer('+100') == 100
