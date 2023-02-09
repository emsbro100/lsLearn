def rotate_array(array)
  new_array = array.clone
  new_array.push(new_array.shift)
end

def rotate_rightmost_digits(number, n)
  (number.to_s[0...-n] + rotate_array(number.to_s[-n..].chars).join).to_i
end

def max_rotation(number)
  size = number.to_s.length
  size.times { |itr| number = rotate_rightmost_digits(number, size - itr) }
  number
end

puts max_rotation(735291) == 321579
puts max_rotation(3) == 3
puts max_rotation(35) == 53
puts max_rotation(105) == 15 # the leading zero gets dropped
puts max_rotation(8_703_529_146) == 7_321_609_845
