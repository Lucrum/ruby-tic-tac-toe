# frozen_string_literal: true

# tic tac toe board
class TicTacToe
  def initialize(player_one, player_two)
    @player_one = player_one
    @player_two = player_two
    @board = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
  end

  def play
    # core game loop
    victor = nil
    player_one_turn = true

    until victor
      if player_one_turn
        prompt(@player_one)
      else
        prompt(@player_two)
      end

      player_one_turn = !player_one_turn
    end
  end

  def prompt(player)
    puts "#{player.name}, please pick a square"
    render_board
    choice = player_choice
    take_spot(choice, player.symbol)
  end

  def render_board
    @board.length.times do |i|
      puts " #{@board[i][0]} | #{@board[i][1]} | #{@board[i][2]} "
      puts '---+---+---' if i < @board.length - 1
    end
  end

  def player_choice
    loop do
      choice = gets.to_i
      return choice if choice.between?(1, 9) && spot_not_taken?(choice)

      puts 'That is not a valid choice. Try again.'
    end
  end

  def spot_not_taken?(value)
    coords = convert_to_coords(value)
    @board[coords[0]][coords[1]] == value
  end

  # returns an array [row, col]
  def convert_to_coords(value)
    [(value - 1) / 3, (value - 1) % 3]
  end

  def take_spot(value, symbol)
    coords = convert_to_coords(value)
    @board[coords[0]][coords[1]] = symbol
  end
end
