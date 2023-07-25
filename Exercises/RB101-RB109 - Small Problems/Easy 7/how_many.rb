=begin
Write a method that counts the number of occurences of each element in a given
array.

input: array
output: hash

rules:
- words in the array are case-sensitive
- does not need to be able to handle improper inputs
- output should be printed instead of returned

data structure:
- array as input
- hash as output

algorithm:
count_occurrences
=================
- given input array 'elements'
- create a new hash 'occurrences'
- for each object in elements:
  - if occurrences has a key of the object already, increase its value by 1
  - otherwise, create a key of the object and assign it the value 1
- return occurrences
=end

def count_occurrences(elements)
  occurrences = {}
  elements.each do |obj|
    if occurrences.key?(obj) then occurrences[obj] += 1
    else occurrences[obj] = 1
    end
  end
  puts occurrences
end

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

count_occurrences(vehicles)
