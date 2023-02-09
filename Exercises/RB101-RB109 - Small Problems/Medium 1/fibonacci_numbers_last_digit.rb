def fib(num)
  itr = 2
  last_num = 0
  current_num = 1
  next_num = 0

  while itr <= num
    next_num = last_num + current_num
    last_num = current_num % 10
    current_num = next_num % 10
    itr += 1
  end

  current_num
end
