require_relative "board.rb"
require_relative "card.rb"
require_relative "game.rb"


class Human_player

  # def initialize
  #   gam = Game.new
  #   @board = gam.board
  # end

  def prompt
    puts "Type two numbers, each no greater than 4 separated by a space."
    puts "eg. 3 1"
    pos = gets.chomp.split(" ").map {|ele| ele.to_i}
    raise "Too Large, enter again" if pos[0] > 4 || pos[1] > 4
    return pos
  end

end