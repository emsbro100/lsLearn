def letter_percentages(string)
  upper = 0
  lower = 0
  neither = 0

  string.chars.each do |char|
    if char =~ /[A-Z]/
      upper += 1
    elsif char =~ /[a-z]/
      lower += 1
    else
      neither += 1
    end
  end

  total = (upper + lower + neither).to_f
  percentages = { lowercase: (lower / total) * 100,
                  uppercase: (upper / total) * 100,
                  neither: (neither / total) * 100 }
end

puts letter_percentages('abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
puts letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
puts letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }
