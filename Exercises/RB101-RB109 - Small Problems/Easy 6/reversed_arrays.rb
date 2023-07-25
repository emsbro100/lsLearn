=begin
Write a method that takes an Array as an argument, and reverses its elements in
place; that is, mutate the Array passed into this method. The return value
should be the same Array object.

You may not use Array#reverse or Array#reverse!.

input: array
output: array (same object)

explicit rules:
- return value should be the same object passed in as the argument
- cannot use Array#reverse or Array#reverse!
implicit rules:
- should not mutate objects within the array
- must be able to handle empty array inputs
- does not need to be able to handle improper inputs

data structure:
- array as input
- array as output

algorithm:
reverse!
========
- given input 'list'
- for however many objects there are in the list, pop the last object from
  the list and insert it at the index of the current iteration.
- return the list
=end

def reverse!(list)
  list.size.times { |idx| list.insert(idx, list.pop) }
  list
end

list = [1, 2, 3]
p reverse!(list)
p list

list = %w(a b c d e)
p reverse!(list)
p list

list = ['abc']
p reverse!(list)
p list

list = []
p reverse!(list)
p list
