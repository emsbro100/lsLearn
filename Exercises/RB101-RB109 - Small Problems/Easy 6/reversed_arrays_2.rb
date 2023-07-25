=begin
Write a method that takes an Array, and returns a new Array with the elements of
the origianl list in reverse order. Do not modify the original list.

You may not use Array#reverse or Array#reverse!, nor may you use the method you
wrote in the previous exercise.

input: array
output: array

explicit rules:
- cannot use Array#reverse or Array#reverse!
- cannot use any method used in the previous exercise
- must not mutate the original object
implicit rules:
- should not mutate objects within the array
- must be able to handle empty array inputs
- does not need to be able to handle improper inputs

data structure:
- array as input
- array as output

algorithm:
reverse
=======
- given input 'list'
- create a new array, 'reversed_list'
- for each object in list, append it to the front of reversed_list.
- return reversed_list
=end

def reverse(list)
  reversed_list = []
  list.each { |item| reversed_list.unshift(item) }
  reversed_list
end

puts reverse([1,2,3,4]) == [4,3,2,1]          # => true
puts reverse(%w(a b e d c)) == %w(c d e b a)  # => true
puts reverse(['abc']) == ['abc']              # => true
puts reverse([]) == []                        # => true

list = [1, 3, 2]                      # => [1, 3, 2]
new_list = reverse(list)              # => [2, 3, 1]
puts list.object_id != new_list.object_id  # => true
puts list == [1, 3, 2]                     # => true
puts new_list == [2, 3, 1]                 # => true
