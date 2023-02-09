def balanced?(string)
  string = string.clone

  while string =~ /\(/ && string =~ /\)/
    left = string =~ /\(/
    right = string =~ /\)/

    if right < left
      return false
    else
      string[right] = ''
      string[left] = ''
    end
  end

  return false if string =~ /\(/ || string =~ /\)/
  
  true
end

puts balanced?('What (is) this?') == true
puts balanced?('What is) this?') == false
puts balanced?('What (is this?') == false
puts balanced?('((What) (is this))?') == true
puts balanced?('((What)) (is this))?') == false
puts balanced?('Hey!') == true
puts balanced?(')Hey!(') == false
puts balanced?('What ((is))) up(') == false
