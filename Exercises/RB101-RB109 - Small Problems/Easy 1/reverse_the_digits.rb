def reversed_number(number)
  stringified = number.to_s
  length = stringified.length
  newstr = ""
  length.times do |iteration|
    newstr << stringified[length - 1 - iteration]
  end
  newstr.to_i
end

puts reversed_number(12345) == 54321
puts reversed_number(12213) == 31221
puts reversed_number(456) == 654
puts reversed_number(12000) == 21 # No leading zeros in return value!
puts reversed_number(12003) == 30021
puts reversed_number(1) == 1
