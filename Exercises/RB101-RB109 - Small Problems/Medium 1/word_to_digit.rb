NUMBERS = {
  "zero" => 0,
  "one" => 1,
  "two" => 2,
  "three" => 3,
  "four" => 4,
  "five" => 5,
  "six" => 6,
  "seven" => 7,
  "eight" => 8,
  "nine" => 9
}
PHONE_NUMBER = /[\d]{10}/

def word_to_digit(sentence)
  sentence = sentence.clone

  NUMBERS.each { |key, value| sentence.gsub!(/\b#{key}\b/i, value.to_s) }

  sentence.gsub!(/(?<=\d)(\s*)(?=\d)/, '')

  while sentence =~ PHONE_NUMBER
    index = sentence =~ PHONE_NUMBER
    number = sentence[index..index+10]

    number_formatted = "(#{number[..2]}) #{number[3..5]}-#{number[6..]}"

    sentence[index..index+10] = number_formatted
  end
  
  sentence
end

puts word_to_digit('Please call me at six zero eight five five five one two three four. Thanks.')
