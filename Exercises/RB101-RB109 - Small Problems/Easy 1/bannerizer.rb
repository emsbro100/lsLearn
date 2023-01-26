def print_times(num, char)
  num.times { print char }
  return
end

def print_in_box(sentence)
  length = sentence.length
  print "+-"
  print_times(length, '-')
  puts "-+"

  print "| "
  print_times(length, ' ')
  puts " |"

  puts "| #{sentence} |"

  print "| "
  print_times(length, ' ')
  puts " |"

  print "+-"
  print_times(length, '-')
  puts "-+"
end

print_in_box("Text looks so much better in a box.")
