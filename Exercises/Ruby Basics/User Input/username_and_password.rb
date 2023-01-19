USERNAME = "ems"
PASSWORD = "slay"

loop do
  puts ">> Please enter your username:"
  username = gets.chomp
  puts ">> Please enter your password:"
  password = gets.chomp
  unless password != PASSWORD || username != USERNAME
    puts "Welcome!"
    break
  end
  puts ">> Login failed: Invalid Credentials."
end