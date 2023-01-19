PASSWORD = "slay"

loop do
  puts "Please enter your password:"
  password = gets.chomp
  if password == PASSWORD
    puts "Welcome!"
    break
  end
  puts "Invalid password!"
end