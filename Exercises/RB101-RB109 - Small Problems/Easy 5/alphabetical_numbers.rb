=begin
Write a method that takes an Array of Integers between 0 and 19, and returns an
Array of those Integers sorted based on the english words for each number.

input: array
output: array

implicit rules:
- does not need to handle input exceptions

data structure:
- input is an array
- output is a sorted array

algorithm:
- given input array 'numbers'
- sort that array by each number's corresponding english name
- return the sorted array
=end
NUMBER_WORDS = %w(zero one two three four five six seven eight nine ten 
                  eleven twelve thirteen fourteen fifteen sixteen seventeen
                  eighteen nineteen)

def alphabetic_number_sort(numbers)
  numbers.sort_by { |number| NUMBER_WORDS[number] }
end

p alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]
