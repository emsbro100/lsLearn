def triangle(side_1, side_2, side_3)
  sides = [side_1, side_2, side_3]
  
  if sides.reduce(:+) != 180 || sides.include?(0)
    :invalid
  elsif sides.include?(90)
    :right
  elsif sides.any? { |side| side > 90 }
    :obtuse
  else
    :acute
  end
end

puts triangle(60, 70, 50) == :acute
puts triangle(30, 90, 60) == :right
puts triangle(120, 50, 10) == :obtuse
puts triangle(0, 90, 90) == :invalid
puts triangle(50, 50, 50) == :invalid
