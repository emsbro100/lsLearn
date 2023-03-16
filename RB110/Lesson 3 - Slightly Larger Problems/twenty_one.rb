CARD_BACK = "\u{1f0a0}"

CARD_BLOCK_PREFIX = 0x1f000

CARDS = {
  value_names: {
    0 => 'Ace', 1 => 'Two', 2 => 'Three', 3 => 'Four', 4 => 'Five', 5 => 'Six',
    6 => 'Seven', 7 => 'Eight', 8 => 'Nine', 9 => 'Ten', 10 => 'Jack',
    11 => 'Queen', 12 => 'King'
  },
  suits: {
    spades: { name: 'Spades', prefix: 0xA0 },
    hearts: { name: 'Hearts', prefix: 0xB0 },
    diamonds: { name: 'Diamonds', prefix: 0xC0 },
    clubs: { name: 'Clubs', prefix: 0xD0 }
  }
}

def new_deck
  Array.new(52) { |i| i }
end

def deal!(count, deck)
  dealt_cards = []

  count.times { dealt_cards << deck.delete(deck.sample) }

  dealt_cards
end

def id_to_values(card_id)
  suits = [:spades, :hearts, :diamonds, :clubs]

  suit_and_value = card_id.divmod(13)
  [suits[suit_and_value[0]], suit_and_value[1]]
end

def card_symbol(suit, id)
  value = if id > 10
            id + 2
          else
            id + 1
          end

  (CARD_BLOCK_PREFIX + CARDS[:suits][suit][:prefix] + value).chr('utf-8')
end

def card_name(suit, id)
  "#{CARDS[:value_names][id]} of #{CARDS[:suits][suit][:name]}"
end

def hand_id_values(hand)
  values_hand = []

  hand.each do |card_id|
    suit, id = id_to_values(card_id)

    card = {
      name: card_name(suit, id),
      symbol: card_symbol(suit, id),
      value: id > 9 ? 10 : id + 1
    }

    values_hand << card
  end

  values_hand
end

def hand_value(hand)
  hand = hand_id_values(hand)

  hand_values = hand.map { |card| card[:value] }

  while hand_values.include?(1)
    if hand_values.sum + 10 <= 21
      hand_values[hand_values.find_index(1)] = 11
    else
      break
    end
  end

  hand_values.sum
end

def get_option(options)
  input = gets.chomp.downcase

  loop do
    options.each { |option| return option if option[0] == input[0] }

    puts "Please enter a valid option!"
    input = gets.chomp.downcase
  end
end

def clear
  Gem.win_platform? ? (system "cls") : (system "clear")
end

def display_cards(hand, hidden_count = 0)
  hand = hand_id_values(hand)

  hand.each do |card|
    if hidden_count > 0
      hidden_count -= 1
      puts "#{CARD_BACK} Hidden Card"
    else
      puts "#{card[:symbol]} #{card[:name]}"
    end
  end
end

def display_value(hand)
  puts "Your hand currently totals #{hand_value(hand)}."
end

def player_turn(deck, player_hand, dealer_hand)
  loop do
    display_hands(player_hand, dealer_hand)
    # display_value(player_hand)
    puts "What would you like to do? (Hit | Stay)"

    choice = get_option(%w(hit stay))
    break if choice == 'stay'

    player_hand.concat(deal!(1, deck))
    break if hand_value(player_hand) >= 21
  end
end

def dealer_turn(deck, dealer_hand)
  loop do
    break if hand_value(dealer_hand) >= 17
    dealer_hand.concat(deal!(1, deck))
  end
end

def display_hands(player_hand, dealer_hand, hidden = true)
  clear

  puts "Dealer's Hand:"
  display_cards(dealer_hand, hidden ? 1 : 0)
  puts

  puts "Your Hand:"
  display_cards(player_hand)
  puts
end

def compare_hands(player_hand, dealer_hand)
  player_value = hand_value(player_hand)
  dealer_value = hand_value(dealer_hand)

  if player_value > 21
    'player bust'
  elsif player_value == 21 && dealer_value != 21
    '21'
  elsif dealer_value > 21
    'dealer bust'
  elsif dealer_value == 21 && player_value != 21
    'dealer 21'
  else
    case player_value <=> dealer_value
    when -1 then dealer_value == 21 ? 'dealer 21' : 'loss'
    when 0 then 'tie'
    when 1 then player_value == 21 ? '21' : 'win'
    end
  end
end

def print_winner(outcome)
  text = case outcome
         when 'player bust' then "Bust! Better luck next time."
         when '21' then "21! Good job!"
         when 'dealer bust' then "Dealer bust! You win!"
         when 'win' then "You won! Good job!"
         when 'tie' then "Tie! The dealers hand is equal to yours."
         when 'dealer 21' then "Dealer 21! Better luck next time."
         when 'loss' then "You lose! Better luck next time."
         end
  puts text
end

puts "Welcome to Twenty-One!"
puts "Press enter to begin."
gets

loop do
  deck = new_deck

  player_hand = deal!(2, deck)
  dealer_hand = deal!(2, deck)

  player_turn(deck, player_hand, dealer_hand) if hand_value(player_hand) != 21

  dealer_turn(deck, dealer_hand) if hand_value(player_hand) < 21

  display_hands(player_hand, dealer_hand, false)
  print_winner(compare_hands(player_hand, dealer_hand))

  puts "Would you like to play again? (y/n)"
  break unless gets.chomp.downcase.start_with?('y')
end
