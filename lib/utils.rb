# frozen_string_literal: true

# returns an array of both players
def init_players
  player_one_name = get_name(1)
  player_one_symbol = get_symbol(player_one_name)

  player_two_name = get_name(2, player_one_name)
  player_two_symbol = get_symbol(player_two_name, player_one_symbol)

  [Player.new(player_one_name, player_one_symbol),
   Player.new(player_two_name, player_two_symbol)]
end

def get_symbol(player_name, other_symbol = nil)
  puts "#{player_name}, what symbol would you like on the board?"
  loop do
    symbol = gets.chomp

    return symbol if symbol.length == 1 && symbol != other_symbol

    if symbol == other_symbol
      puts "The other player has taken #{other_symbol}. Please try again."
    else
      puts 'That is not a valid symbol. Please try again.'
    end
  end
end

def get_name(number, other_name = nil)
  puts "Player #{number}, what is your name?"
  loop do
    name = gets.chomp

    return name if !name.empty? && name != other_name

    if name == other_name
      puts "The other player has taken #{other_name}. Please try again."
    else
      puts 'That is not a valid name. Please try again.'
    end
  end
end
