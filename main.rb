# frozen_string_literal: true

require_relative 'lib/player'
require_relative 'lib/utils'
require_relative 'lib/tictactoe'

# initialize players
players = init_players

game = TicTacToe.new(players[0], players[1])
game.play

# initialize game
