# frozen_string_literal: true

require_relative 'lib/player'
require_relative 'lib/utils'
require_relative 'lib/tictactoe'

# initialize players
puts 'Player 1, what is your name?'

player_one_name = gets.chomp
player_one_symbol = get_symbol(player_one_name)

puts 'Player 2, what is your name?'

player_two_name = gets.chomp
player_two_symbol = get_symbol(player_two_name)

player_one = Player.new(player_one_name, player_one_symbol)
player_two = Player.new(player_two_name, player_two_symbol)

puts "#{player_one.name} and #{player_two.name}, welcome"

game = TicTacToe.new(player_one, player_two)
game.play

# initialize game
