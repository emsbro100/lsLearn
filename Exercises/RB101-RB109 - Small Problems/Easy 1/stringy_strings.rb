def stringy(number)
  str = ''
  number.times do |num|
    if num.even?
      str << '1'
    else
      str << '0'
    end
  end
  str
end

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'
