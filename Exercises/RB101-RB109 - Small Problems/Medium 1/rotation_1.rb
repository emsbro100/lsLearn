def rotate_array(array)
  new_array = array.clone
  new_array.push(new_array.shift)
end

def rotate_string(string)
  rotate_array(string.chars).join
end

def rotate_integer(int)
  rotate_string(int.to_s).to_i
end

puts rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
puts rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
puts rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
puts rotate_array(x) == [2, 3, 4, 1]   # => true
puts x == [1, 2, 3, 4]                 # => true

puts rotate_string("hello")
puts rotate_integer(12345)
