# Ask user for two numbers
# Ask user what operation to perform (multiply, divide, add, subtract)
# Output result of operation

prompts = {

}

def prompt(message)
  puts "=> #{message}"
end

def get_input
  input = gets.chomp.downcase
  if input == 'q'
    exit(0)
  end
  input
end

def get_bool
  loop do
    input = get_input
    if input == "y" || input == "yes"
      return true
    elsif input == "n" || input == "no"
      return false
    end
    prompt "Invalid input! Please enter (y/n)"
  end
end

def get_number
  loop do
    input = get_input
    if input.include?('.') # Algorithm to verify floats
      parts = input.split('.')
      # Maps true/false to whether part contains a non-numeric character
      parts.map! { |part| part.match(/[\D]/) ? true : false }
      return input.to_f if !(parts.size > 2) && !(parts.include?(true))
    elsif !(input.match(/\D/)) && input.length > 0 # Algorithm to verify integers
      return input.to_i
    end
    prompt "Invalid input! Please enter an integer or float:"
  end
end

def get_operation(valid_operations)
  loop do
    input = get_input
    if valid_operations.include?(input)
      return input
    end
    prompt "Invalid operation! Please enter (add/subtract/multiply/divide)"
  end
end

prompt "Welcome to Calculator! Enter q anytime to quit."
puts ""

loop do
  prompt "What two numbers would you like to perform an operation on?"
  prompt "Please enter each number on a separate line:"
  num1 = get_number
  num2 = get_number

  prompt <<-MSG
What operation would you like to perform on these numbers?
   (add/subtract/multiply/divide)
  MSG
  operation = get_operation(%w(add subtract multiply divide))

  result = case operation
           when "add"
             num1 + num2
           when "subtract"
             num1 - num2
           when "multiply"
             num1 * num2
           when "divide"
             num1 / num2.to_f
           else
             prompt "Invalid operation!"
             puts ""
             next
           end
  prompt "Result: #{result}"
  prompt "Would you like to perform another operation? (y/n)"
  continue = get_bool
  if !continue
    break
  end
end
