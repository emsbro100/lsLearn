WIN_CONDITION = 21
DEALER_MIN = 17
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
END_TEXTS = {
  :pbust => "Bust! Better luck next time.",
  :dbust => "Dealer bust! You win!",
  :'21' => "21! Good job!",
  :d21 => "Dealer 21! Better luck next time.",
  1 => "You won! Good job!",
  0 => "Tie! The dealers hand is equal to yours.",
  -1 => "You lose! Better luck next time."
}

def new_deck
  Array.new(52) { |i| i }
end

def deal!(count, deck)
  dealt_cards = []

  count.times { dealt_cards << deck.delete_at(rand(deck.size)) }

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
    if hand_values.sum + 10 <= WIN_CONDITION
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
    # display_value(player_hand) # I feel the game is more organic without this
    puts "What would you like to do? (Hit | Stay)"

    choice = get_option(%w(hit stay))
    break if choice == 'stay'

    player_hand.concat(deal!(1, deck))
    break if hand_value(player_hand) >= WIN_CONDITION
  end
end

def dealer_turn(deck, dealer_hand)
  loop do
    break if hand_value(dealer_hand) >= DEALER_MIN
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

def print_scores(player_score, computer_score)
  puts "Player's score: #{player_score}, Dealer's score: "\
       "#{computer_score}"
end

def compare_hands(player_hand, dealer_hand)
  player_total = hand_value(player_hand)
  dealer_total = hand_value(dealer_hand)

  return :pbust if player_total > WIN_CONDITION
  return :'21' if player_total == WIN_CONDITION && dealer_total != WIN_CONDITION
  return :dbust if dealer_total > WIN_CONDITION
  return :d21 if dealer_total == WIN_CONDITION && player_total != WIN_CONDITION

  player_total <=> dealer_total
end

def check_winner(outcome)
  return :player if [:'21', :dbust, 1].include?(outcome)
  return :dealer if [:d21, :pbust, -1].include?(outcome)
end

def print_winner(outcome)
  puts END_TEXTS[outcome]
end

def winner?(scores)
  scores[:player] == 5 || scores[:dealer] == 5
end

def print_grand_winner(scores)
  if scores[:player] == 5
    puts "You are the grand winner! Good job!"
  else
    puts "The dealer is the grand winner! Better luck next time!"
  end
end

puts "Welcome to Twenty-One!"
puts "Press enter to begin."
gets

loop do
  scores = { player: 0, dealer: 0 }

  loop do
    break if winner?(scores)

    deck = new_deck

    player_hand = deal!(2, deck)
    dealer_hand = deal!(2, deck)

    if hand_value(player_hand) != WIN_CONDITION
      player_turn(deck, player_hand, dealer_hand)
    end

    dealer_turn(deck, dealer_hand) if hand_value(player_hand) < WIN_CONDITION

    outcome = compare_hands(player_hand, dealer_hand)
    case check_winner(outcome)
    when :player then scores[:player] += 1
    when :dealer then scores[:dealer] += 1
    end

    display_hands(player_hand, dealer_hand, false)
    print_winner(outcome)
    print_scores(scores[:player], scores[:dealer])

    puts "Press enter to continue."
    gets
  end

  print_grand_winner(scores)

  puts "Would you like to play again? (y/n)"
  break unless gets.chomp.downcase.start_with?('y')
end
