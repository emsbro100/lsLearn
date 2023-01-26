def center_of(string)
  char = ''
  if string.size.odd?
    char << string[string.size / 2]
  else
    char << string[string.size / 2 - 1]
    char << string[string.size / 2]
  end
  char
end

puts center_of('I love ruby') == 'e'
puts center_of('Launch School') == ' '
puts center_of('Launch') == 'un'
puts center_of('Launchschool') == 'hs'
puts center_of('x') == 'x'
