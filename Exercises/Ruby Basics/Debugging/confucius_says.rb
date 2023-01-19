def get_quote(person)
  if person == 'Yoda'
    'Do. Or do not. There is no try.'
  elsif person == 'Confucius'
    'I hear and I forget. I see and I remember. I do and I understand.'
  elsif person == 'Einstein'
    'Do not worry about your difficulties in Mathematics. I can assure you mine are still greater.'
  end
end

puts 'Confucius says:'
puts '"' + get_quote('Confucius') + '"'

# The problem is caused because after the proper return value there is another
# if statement that doesn't skip once a prior evaluates to true.
# This can be fixed by either changing this to an if/elsif chain or case
# statement, or by simply putting return in front of the string to return.