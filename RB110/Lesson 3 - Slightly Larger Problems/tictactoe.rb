LINE_HORIZONTAL = "\u{2500}"
LINE_VERTICAL = "\u{2502}"
LINE_PLUS = "\u{253c}"
MIDDLE_LINE = Array.new(3) { LINE_HORIZONTAL * 3 }.join(LINE_PLUS)
BOARD_LINES = [[1, 5, 9], [3, 5, 7], # Diagonal
               [1, 2, 3], [4, 5, 6], [7, 8, 9], # Horizontal
               [1, 4, 7], [2, 5, 8], [3, 6, 9]] # Vertical

def generate_board
  (1..9).each_with_object({}) { |n, obj| obj[n] = ' ' }
end

def append_number_grid!(display_lines)
  [[1, 2, 3], [4, 5, 6], [7, 8, 9]].each_with_index do |nums, idx|
    display_lines[idx] += "  #{nums.join(' ')}"
  end
end

def display(board)
  Gem.win_platform? ? (system "cls") : (system "clear")

  board_arr = []
  board.values.each_slice(3) { |slice| board_arr << slice }

  lines = []

  board_arr.each_index do |line|
    lines << MIDDLE_LINE unless line == 0
    lines << board_arr[line].map { |char| " #{char} " }.join(LINE_VERTICAL)
  end

  append_number_grid!(lines)

  lines.each { |line| puts line }
end

def get_empty_positions(board)
  empty = []
  board.each do |k, v|
    empty << k if v == ' '
  end
  empty
end

def update_board!(board, position, char)
  board[position] = char
end

def all_x_or_o?(board, line)
  line.all? { |pos| board[pos] == 'X' } || line.all? { |pos| board[pos] == 'O' }
end

def check_board(board)
  BOARD_LINES.each do |line| # Check for winners
    if all_x_or_o?(board, line)
      return board[line[0]]
    end
  end

  return 'TIE' unless board.any? { |_, v| v == ' ' } # Check for tie

  nil # No winner or tie
end

def joinor(arr, delimiter=', ', final_delimiter='or')
  joined_str = arr[0].to_s

  (arr.size - 1).times do |num|
    if arr.size == 2
      joined_str += " #{final_delimiter} "
    elsif num >= arr.size - 2
      joined_str << "#{delimiter}#{final_delimiter} "
    else
      joined_str << delimiter
    end

    joined_str << arr[num + 1].to_s
  end

  joined_str
end

def find_at_risk_square(board, char)
  BOARD_LINES.each do |line| # Check for winners
    line_values = line.each_with_object([]) { |pos, obj| obj << board[pos] }
    if line_values.count(char) == 2 && line_values.include?(' ')
      return line[line_values.find_index(' ')]
    end
  end

  nil
end

def deep_clone(value) # From Evan Pon on stackoverflow
  if value.is_a?(Hash)
    result = value.clone
    value.each { |k, v| result[k] = deep_clone(v) }
    result
  elsif value.is_a?(Array)
    result = value.clone
    result.clear
    value.each { |v| result << deep_clone(v) }
    result
  else
    value
  end
end

def score_node(board, winning_char)
  case check_board(board)
  when winning_char then 1
  when 'X' || 'O' then -1
  when 'TIE' then 0
  end
end

def generate_nodes(board, choice = nil, user = 'O', user_turn = true)
  tree = { choice: choice, score: nil, subtree: [] }
  positions_arr = get_empty_positions(board)

  opponent = user == 'O' ? 'X' : 'O'
  char = user_turn ? user : opponent

  loop do
    break if positions_arr.empty? || check_board(board) # Break if terminal node

    pos = positions_arr.pop

    board_clone = deep_clone(board)
    update_board!(board_clone, pos, char)

    subtree_node = generate_nodes(board_clone, pos, user, !user_turn)
    tree[:subtree].push(subtree_node)
  end

  tree[:score] = score_node(board, user)

  tree
end

def minimax!(node, maximizing)
  return node[:score] if node[:score] # Return node value if terminal node

  if maximizing
    value = -Float::INFINITY

    node[:subtree].each do |subnode|
      subnode[:score] = minimax!(subnode, false)
      value = subnode[:score] if subnode[:score] > value
    end
  else # minimizing player
    value = Float::INFINITY

    node[:subtree].each do |subnode|
      subnode[:score] = minimax!(subnode, true)
      value = subnode[:score] if subnode[:score] < value
    end
  end

  value
end

def ai_simple(board)
  get_empty_positions(board).sample
end

def ai_defensive(board)
  defend_square = find_at_risk_square(board, 'X')
  return defend_square if defend_square

  ai_simple(board)
end

def ai_offensive(board)
  attack_square = find_at_risk_square(board, 'O')
  return attack_square if attack_square

  defend_square = find_at_risk_square(board, 'X')
  return defend_square if defend_square

  return 5 if get_empty_positions(board).include?(5)

  ai_simple(board)
end

def ai_minimax(board)
  node_tree = generate_nodes(board)

  score = minimax!(node_tree, true)

  node_tree[:subtree].each do |node|
    return node[:choice] if node[:score] == score
  end
end

def player_turn(board)
  puts "Please enter the number of the position you want to put an X in:"
  puts "(#{joinor(get_empty_positions(board))})"
  update_board!(board, get_position(get_empty_positions(board)), 'X')
end

def computer_turn(board)
  position = ai_minimax(board)
  update_board!(board, position, 'O')
end

def get_position(valid_positions)
  position = gets.chomp.to_i
  until valid_positions.include?(position)
    puts "Please enter a valid number position!"
    position = gets.chomp.to_i
  end
  position
end

def get_option(options)
  input = gets.chomp.downcase

  loop do
    options.each { |option| return option if option[0] == input[0] }

    puts "Please enter a valid option!"
    input = gets.chomp.downcase
  end
end

def print_result(winner)
  case winner
  when 'TIE'
    puts "It's a tie!"
  when 'X'
    puts "You win!"
  when 'O'
    puts "Computer wins!"
  end
end

def print_scores(player_score, computer_score)
  puts "Player's score: #{player_score}, Computer's score: "\
       "#{computer_score}"
end

def print_grand_winner(scores)
  if scores[:player] == 5
    puts "You are the grand winner! Good job!"
  else
    puts "The computer is the grand winner! Better luck next time!"
  end
end

def print_rules
  RULES.each { |rule| puts rule.center(80) }

  puts
  puts "Press enter once you are ready to begin playing.".center(80)
  gets
end

def determine_winner(board_winner)
  case board_winner
  when 'X' then 'player'
  when 'O' then 'computer'
  else 'none'
  end
end

def grand_winner?(scores)
  scores[:player] == 5 || scores[:computer] == 5
end

def game_loop(turn)
  board = generate_board

  display(board)

  while !check_board(board)
    if turn == "player"
      player_turn(board)
      turn = "computer"
    else
      computer_turn(board)
      display(board)
      turn = "player"
    end
  end

  display(board) if turn == "computer"
  print_result(check_board(board))

  determine_winner(check_board(board))
end

RULES = [
  "Tic Tac Toe is a 2 player game played on a 3x3 board. Each player takes",
  "a turn and marks a square on the board. The first player to reach 3 squares",
  "in a row, including diagonals, wins. If all 9 squares are marked and no",
  "player has 3 squares in a row, then the game is a tie.",
  "The grand winner is the first to 5 wins."
]

puts "Welcome to Tic-Tac-Toe!"

puts "Would you like to read the rules? (y/n)"
print_rules if gets.chomp.downcase.start_with?('y')

loop do
  scores = { player: 0, computer: 0 }

  loop do
    puts "Who should go first? (player, computer, random)"
    first_turn = get_option(%w(player computer random))
    first_turn = %w(player computer).sample if first_turn == 'random'

    winner = game_loop(first_turn)
    case winner
    when 'player' then scores[:player] += 1
    when 'computer' then scores[:computer] += 1
    end

    print_scores(scores[:player], scores[:computer])

    if grand_winner?(scores)
      print_grand_winner(scores)
      break
    end

    puts "Press enter to continue."
    gets
  end

  puts "Would you like to play again? (y/n)"
  break unless gets.chomp.downcase.start_with?('y')
end

puts "Thank you for playing!"
