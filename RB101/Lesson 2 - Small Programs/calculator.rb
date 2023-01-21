# Ask user for two numbers
# Ask user what operation to perform (multiply, divide, add, subtract)
# Output result of operation

def get_input
  input = gets.chomp.downcase
  if input == 'q'
    exit(0)
  end
  input
end

def get_integer
  loop do
    input = get_input
    if input.to_i.to_s == input
      return input.to_i
    end
    puts "Invalid input! Please enter an integer:"
  end
end

def get_operation(valid_operations)
  loop do
    input = get_input
    if valid_operations.include?(input)
      return input
    end
    puts "Invalid operation! Please enter (add/subtract/multiply/divide)"
  end
end

puts "Welcome to Calculator! Enter q anytime to quit."
puts ""

loop do
  puts "What two numbers would you like to perform an operation on?"
  puts "Please enter each number on a separate line:"
  num1 = get_integer
  num2 = get_integer

  puts "What operation would you like to perform on these numbers? (add/subtract/multiply/divide)"
  operation = get_operation(["add", "subtract", "multiply", "divide"])
  result = 0

  case operation
  when "add"
    result = num1 + num2
  when "subtract"
    result = num1 - num2
  when "multiply"
    result = num1 * num2
  when "divide"
    result = num1 / num2.to_f
  else
    puts "Invalid operation!"
    puts ""
    next
  end
  puts "Result: #{result}"
  break
end