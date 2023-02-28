=begin
Write a method that takes an array of strings, and returns an array of the same
string values, except with the vowels removed.

input: array
output: array

implicit rules:
- should return empty string for words with only vowels
- does not need to handle exceptions

data structure:
- input is an array
- output is an array

algorithm:
- given input array 'str_array'
- for each item in str_array, delete the vowels from the string
- return an array with the modified strings
=end

def remove_vowels(str_array)
  str_array.map { |str| str.delete("[aeiouAEIOU]") }
end

p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz))
p remove_vowels(%w(green YELLOW black white))
p remove_vowels(%w(ABC AEIOU XYZ))
