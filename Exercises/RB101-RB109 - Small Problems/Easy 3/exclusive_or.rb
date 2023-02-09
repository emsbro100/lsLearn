def xor?(first_arg, second_arg)
  (first_arg || second_arg) && (!first_arg || !second_arg)
end

puts xor?(5.even?, 4.even?) == true
puts xor?(5.odd?, 4.odd?) == true
puts xor?(5.odd?, 4.even?) == false
puts xor?(5.even?, 4.odd?) == false
