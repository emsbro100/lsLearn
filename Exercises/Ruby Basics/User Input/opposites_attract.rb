def valid_number?(number_string)
  number_string.to_i.to_s == number_string && number_string.to_i != 0
end

int1 = nil
int2 = nil

loop do # gather integers
  loop do # first integer
    puts ">> Please enter a positive or negative integer:"
    int1 = gets.chomp
    if valid_number?(int1)
      int1 = int1.to_i
      break
    end
    puts ">> Invalid input. Only non-zero integers are allowed."
  end
  loop do # second integer
    puts ">> Please enter a positive or negative integer:"
    int2 = gets.chomp
    if valid_number?(int2)
      int2 = int2.to_i
      break
    end
    puts ">> Invalid input. Only non-zero integers are allowed."
  end
  maximum_range = int1.abs() + int2.abs()
  if int1 + int2 >= maximum_range || int1 + int2 <= 0 - maximum_range
    puts ">> One integer must be positive and one integer must be negative."
    puts ">> Please start over."
  else
    puts "#{int1} + #{int2} = #{int1 + int2}"
    break
  end
end