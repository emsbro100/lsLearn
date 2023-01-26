def triangle(length)
  (length + 1).times do |difference|
    (length - difference).times { print ' ' }
    difference.times { print '*' }
    puts
  end
end

triangle(5)
