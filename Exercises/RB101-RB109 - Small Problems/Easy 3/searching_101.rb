numbers = []

def prompt(message)
  puts "=> #{message}"
end

prompt("Enter the 1st number:")
numbers.push(gets.chomp.to_i)
prompt("Enter the 2nd number:")
numbers.push(gets.chomp.to_i)
prompt("Enter the 3rd number:")
numbers.push(gets.chomp.to_i)
prompt("Enter the 4th number:")
numbers.push(gets.chomp.to_i)
prompt("Enter the 5th number:")
numbers.push(gets.chomp.to_i)
prompt("Enter the last number:")
last_num = gets.chomp.to_i

if numbers.include?(last_num)
  puts "The number #{last_num} appears in #{numbers}."
else
  puts "The number #{last_num} does not appear in #{numbers}."
end
