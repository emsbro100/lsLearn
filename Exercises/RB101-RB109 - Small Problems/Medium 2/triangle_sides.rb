def triangle(side_1, side_2, side_3)
  side_lengths = [side_1, side_2, side_3]
  return :invalid if side_lengths.include?(0)
  case side_lengths.uniq.size
  when 1
    :equilateral
  when 2
    max = side_lengths.delete_at(side_lengths.find_index(side_lengths.max))
    if side_lengths.reduce(:+) < max
      :invalid
    else
      :isosceles
    end
  when 3
    :scalene
  end
end

puts triangle(3, 3, 3) == :equilateral
puts triangle(3, 3, 1.5) == :isosceles
puts triangle(3, 4, 5) == :scalene
puts triangle(0, 3, 3) == :invalid
puts triangle(3, 1, 1) == :invalid
