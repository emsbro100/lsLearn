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

langfile = "Translations/"
languages = {"en" => "english.yml",
             "es" => "espanol.yml",
             "fr" => "francais.yml"}
CONFIG = YAML.load(File.read("config.yml")).transform_keys(&:to_sym)
if languages.keys.include?(CONFIG[:language])
  langfile << languages[CONFIG[:language]]
  PROMPTS = YAML.load(File.read(langfile)).transform_keys(&:to_sym)
else
  puts "Calculator does not have a translation for the specified language! Press enter to load the program in English..."
  gets()
  PROMPTS = YAML.load(File.read("Translations/english.yml")).transform_keys(&:to_sym)
end
OPERATIONS = {add:      PROMPTS[:operations]["add"],
              subtract: PROMPTS[:operations]["subtract"],
              multiply: PROMPTS[:operations]["multiply"],
              divide:   PROMPTS[:operations]["divide"]}

def prompt(message)
  puts "=> #{message}"
end

def input_loop(is_type, response)
  loop do
    input = gets.chomp.downcase
    if is_type.call(input)
      return input
    else
      prompt response
    end
  end
end

def get_input(type)
  input = case type
          when :bool # Returns y/n
            input_loop(method(:bool?), PROMPTS[:input]["bool"])
          when :number # Returns a float
            input_loop(method(:number?), PROMPTS[:input]["number"]).to_f
          when :operation # Returns add/subtract/multiply/divide
            input_loop(method(:operation?), PROMPTS[:input]["operation"])
          end
  return input
end

def bool?(input)
  valid = [PROMPTS[:input]["bool_yes"], PROMPTS[:input]["bool_no"]]
  valid.push(valid[0][0]) # Add "y"
  valid.push(valid[1][0]) # Add "n"
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
  if OPERATIONS.values.include?(input)
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
  num1 = get_input(:number)
  num2 = get_input(:number)

  prompt PROMPTS[:ask_operation]
  prompt "(#{OPERATIONS[:add]}/#{OPERATIONS[:subtract]}/#{OPERATIONS[:multiply]}/#{OPERATIONS[:divide]})"
  operation = get_input(:operation)

  result = case operation
           when OPERATIONS[:add]
             num1 + num2
           when OPERATIONS[:subtract]
             num1 - num2
           when OPERATIONS[:multiply]
             num1 * num2
           when OPERATIONS[:divide]
             num1 / num2
           end
  prompt "#{PROMPTS[:result]} #{result}"
  prompt PROMPTS[:ask_repeat]
  continue = get_input(:bool)
  if continue[0] == 'n'
    break
  end
end
