def fib(num)
  return num if num < 2
  fib(num - 1) + fib(num - 2)
end

puts fib(20)
