=begin
Write a method named include? that takes an Array and a search value as
arguments. This method should return true if the search value is in the array,
false if it is not. You may not use the Array#include? method in your solution.

input: array, object
output: bool

explicit rules:
- may not use Array#include?
implicit rules:
- must handle empty array inputs
- does not need to handle improper inputs

data structure:
- array as input
- object as input

algorithm:
include?
========
- given inputs 'arr' and 'obj'
- iterate through arr
  - if the value is equal to obj, return true
- return false if no value is equal to obj
=end

def include?(arr, obj)
  arr.each { |item| return true if item == obj }
  false
end

puts include?([1,2,3,4,5], 3) == true
puts include?([1,2,3,4,5], 6) == false
puts include?([], 3) == false
puts include?([nil], nil) == true
puts include?([], nil) == false
