password = nil

def set_password
  puts 'What would you like your password to be?'
  new_password = gets.chomp
end

def verify_password(password)
  puts '** Login **'
  print 'Password: '
  input = gets.chomp

  if input == password
    puts 'Welcome to the inside!'
  else
    puts 'Authentication failed.'
  end
end

if !password
  password = set_password
end

verify_password(password)

# It doesn't work because password is never assigned to anything, and because
# verify_password isn't passed a password to compare with.
# This is fixed by changing set_password to password = set_password, and by
# adding a password parameter to verify_password.
