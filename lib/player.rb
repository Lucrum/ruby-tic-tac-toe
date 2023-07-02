# frozen_string_literal: true

# player class
class Player
  attr_accessor :name, :symbol, :points

  def initialize(name, symbol)
    @name = name
    @symbol = symbol
  end
end
