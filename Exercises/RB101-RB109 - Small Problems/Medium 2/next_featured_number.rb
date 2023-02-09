def featured(n)
  numbers = [0]
  counter = 0
  while numbers.last <= n
    counter += 7
    next if counter.even?
    if counter.to_s.chars.uniq.size == counter.to_s.chars.size
      numbers.push(counter)
    end
  end
  numbers.last
end

puts featured(12) == 21
puts featured(20) == 21
puts featured(21) == 35
puts featured(997) == 1029
puts featured(1029) == 1043
puts featured(999_999) == 1_023_547
puts featured(999_999_987) == 1_023_456_987

# puts featured(9_999_999_999) # -> There is no possible number that fulfills those requirements
