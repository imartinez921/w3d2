require_relative "board.rb"
require_relative "card.rb"
require_relative "human_player.rb"

require "byebug"
class Game
  @@DECK = [:A,:A,:B,:B,:C,:C,:D,:D,:E,:E,:F,:F,:G,:G,:H,:H]

  def initialize
    @board = Board.new
    @human_player = Human_player.new

    @previous_guess = nil

    deck = Array.new(16){Card.new(@@DECK.pop)}

    @board.populate(deck)
  end

  def board
    @board
  end

  def play
    @board.render
    while !@board.won?
      previous_pos = @human_player.prompt
      @previous_guess = @board.reveal(previous_pos)

      @board.render

      pos = @human_player.prompt
      raise "Can't pick same spot!" if previous_pos == pos
      guessed_pos = @board.reveal(pos)
      

      @board.render
      if  @previous_guess != guessed_pos
            @board[pos].hide
            @board[previous_pos].hide
      end
    end
  end









end