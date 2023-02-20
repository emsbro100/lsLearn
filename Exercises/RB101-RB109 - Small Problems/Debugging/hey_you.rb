def shout_out_to(name)
  name.upcase!

  puts 'HEY ' + name
end

shout_out_to('you') # expected: 'HEY YOU'

# Chars returns a new array of the characters in name and is not linked to the
# original string, so even though the array is mutated name is not.
# Fixed by calling #upcase! on name itself
