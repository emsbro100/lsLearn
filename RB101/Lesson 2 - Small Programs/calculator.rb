# Ask user for two numbers
# Ask user what operation to perform (multiply, divide, add, subtract)
# Output result of operation

=begin

- Input takes one argument, type
  - a loop begins to check if the input matches the type
    - get the users input
    - if the type verification returns true for the input
      - return true
    - otherwise if input doesn't meet the parameters
      - print "Invalid input! Please enter [type-specific response]"
      - begin the loop again
  - the Input method returns the validated input

START

DEFINE input_parser
  # Receives one argument, type 
  IF type x
    input = input_loop(x_validator, x_response)
  IF type y
    input = input_loop(y_validator, y_response)
  IF type z
    input = input_loop(z_validator, z_response)
  RETURN input

DEFINE input_loop
  # Receives two arguments, type, type_specific_response
  WHILE input_invalid
    GET input
    IF type(input)
      RETURN input
    ELSE
      PRINT type_specific_response

END
=end

require "YAML"

CONFIG = YAML.load(File.read("calculator.yml")).transform_keys(&:to_sym)
PROMPTS = CONFIG[:prompts].transform_keys(&:to_sym)
VALID_OPERATIONS = PROMPTS[:operations].keys
# NEED TO FIX BOOL CHECK! DOES NOT RETURN PROPERLY
def prompt(message)
  puts "=> #{message}"
end

def input_loop(type, response)
  loop do
    input = gets.chomp
    if type.call(input)
      return input
    else
      prompt response
    end
  end
end

def get_input(type)
  input = case type
          when "bool"
            input_loop(method(:bool?), PROMPTS[:input]["bool"])
          when "number"
            input_loop(method(:number?), PROMPTS[:input]["number"])
          when "operation"
            input_loop(method(:operation?), PROMPTS[:input]["operation"])
          end
  return input
end

def bool?(input)
  valid = %w(y yes n no)
  if valid.include?(input)
    return true
  else
    return false
  end
end

def number?(input)
  if input.include?('.') # Algorithm to verify floats
    parts = input.split('.')
    # Maps true/false to whether part contains a non-numeric character
    parts.map! { |part| part.match(/[\D]/) ? true : false }
    return true if !(parts.size > 2) && !(parts.include?(true))
  elsif !(input.match(/\D/)) && input.length > 0 # Algorithm to verify integers
    return true
  else
    return false
  end
end

def operation?(input)
  if VALID_OPERATIONS.include?(input)
    return true
  else
    return false
  end
end

prompt PROMPTS[:welcome]
puts ""

loop do
  prompt PROMPTS[:ask_numbers]
  prompt PROMPTS[:ask_numbers_2]
  num1 = get_input("number")
  num2 = get_input("number")

  prompt PROMPTS[:ask_operation]
  prompt "(#{PROMPTS[:operations]["add"]}/#{PROMPTS[:operations]["subtract"]}/#{PROMPTS[:operations]["multiply"]}/#{PROMPTS[:operations]["divide"]})"
  # for database fetch, do prompt "(#{add}/#{subtract}/#{multiply}/#{divide})"
  operation = get_input("operation")

  result = case operation
           when "add"
             num1 + num2
           when "subtract"
             num1 - num2
           when "multiply"
             num1 * num2
           when "divide"
             num1 / num2.to_f
           end
  prompt "#{PROMPTS[:result]} #{result}"
  prompt PROMPTS[:ask_repeat]
  continue = get_input("bool")
  if !continue
    break
  end
end
