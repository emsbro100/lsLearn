def fib(num)
  itr = 2
  nums = [0, 1]

  while nums.size < num
    nums.push(nums[-1] + nums[-2])
  end

  nums[-1] + nums[-2]
end

puts fib(100_001)
