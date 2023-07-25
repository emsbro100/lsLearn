=begin
Write a method which takes a grocery list (array) of fruits with quantities and
converts it into an array of the correct number of each fruit.

input: array
output: array

rules:
- input array's elements will all be subarrays with a string and an integer

data structure:
- nested arrays as input
- array as output

algorithm:
buy_fruit
=========
- given input array 'quantities'
- create a new array 'values'
- for each subarray in quantities:
  - n times, n being the second element in the subarray:
    - add the fruit (first element in the subarray) to values
- return values
=end

def buy_fruit(quantities)
  values = []
  quantities.each do |subarr|
    subarr[1].times { values.push(subarr[0]) }
  end
  values
end

p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
["apples", "apples", "apples", "orange", "bananas","bananas"]
