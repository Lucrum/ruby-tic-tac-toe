# frozen_string_literal: true

# tic tac toe board
class TicTacToe
  def initialize(player_one, player_two)
    @player_one = player_one
    @player_two = player_two
  end

  def play
    # core game loop
    puts @player_one.name
    puts @player_two.name
  end
end
