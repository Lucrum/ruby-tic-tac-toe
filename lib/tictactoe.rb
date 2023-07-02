# frozen_string_literal: true

# tic tac toe board
class TicTacToe
  def initialize(player_one, player_two)
    @player_one = player_one
    @player_two = player_two
    @board = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
    @victor = nil
    @turn_count = 1
    # true = player one's turn, false = player two's turn
    @player_turn = true
  end

  def play
    # core game loop
    until @victor
      if @player_turn
        prompt(@player_one)
      else
        prompt(@player_two)
      end

      @player_turn = !@player_turn
      check_victory
    end
    finish_game
  end

  def prompt(player)
    puts "\n #{player.name}, please pick a square \n"
    render_board
    choice = player_choice
    take_spot(choice, player.symbol)
  end

  def render_board
    print "\n"
    @board.length.times do |i|
      puts " #{@board[i][0]} | #{@board[i][1]} | #{@board[i][2]} "
      puts '---+---+---' if i < @board.length - 1
    end
    print "\n"
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

  def finish_game
    if @victor == true
      puts "\n It's a tie!"
    else
      puts "\n #{@victor.name} has won!"
    end
  end

  def check_victory
    check_rows
    check_cols
    check_diags

    @victor = true if @turn_count == 9 && @victor.nil?
    @turn_count += 1
  end

  def check_rows
    3.times do |i|
      if @board[i].all? { |spot| spot == @player_one.symbol }
        @victor = @player_one
      elsif @board[i].all? { |spot| spot == @player_two.symbol }
        @victor = @player_two
      end
    end
  end

  def check_cols
    3.times do |i|
      if check_a_col(i, @player_one.symbol)
        @victor = @player_one
      elsif check_a_col(i, @player_two.symbol)
        @victor = @player_two
      end
    end
  end

  def check_diags
    if check_diag_one(@player_one.symbol) || check_diag_two(@player_one.symbol)
      @victor = @player_one
    elsif check_diag_one(@player_two.symbol) || check_diag_two(@player_two.symbol)
      @victor = @player_two
    end
  end

  def check_a_col(col, symbol)
    @board[0][col] == symbol &&
      @board[1][col] == symbol &&
      @board[2][col] == symbol
  end

  def check_diag_one(symbol)
    @board[0][0] == symbol &&
      @board[1][1] == symbol &&
      @board[2][2] == symbol
  end

  def check_diag_two(symbol)
    @board[0][2] == symbol &&
      @board[1][1] == symbol &&
      @board[2][0] == symbol
  end
end
