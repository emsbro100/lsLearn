def read_text(filename)
  text = File.new(filename, 'r')
  IO.read(text).gsub("\n", ' ')
end

def longest_sentence(text)
  longest = [0, 0] # idx, length

  sentences = text.split(/[.?!]/)
  
  sentences.each_with_index do |sentence, idx|
    if sentence.split(' ').size > longest[1]
      longest[0] = idx
      longest[1] = sentence.split(' ').size
    end
  end

  puts "The following sentence has #{longest[1]} words:"
  sentences[longest[0]].strip
end

puts longest_sentence(read_text("pg84.txt"))
