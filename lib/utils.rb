# frozen_string_literal: true

def get_symbol(player_name)
  symbol = ''
  puts "#{player_name}, what symbol would you like on the board?"
  loop do
    symbol = gets.chomp

    return symbol if symbol.length == 1

    puts 'That is not a valid symbol. Please try again.'
  end
end
