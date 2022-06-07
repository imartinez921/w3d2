require_relative "card.rb"

class Board 

  def initialize(size=4)
    @board = Array.new(size) {Array.new(size) {nil}}
    @size = size
  end

  def size
    @size
  end

  def [](pos)
    @board[pos[0]][pos[1]]
  end

  def populate(array)
    @board.each_with_index do |ele_0, idx_0|
      x = rand(0...@board.length)
      ele_0.each_with_index do |ele_1, idx_1|
        y = rand(0...@board.length)

        while @board[x][y] != nil
          x = rand(0...@board.length)
          y = rand(0...@board.length)
        end
        
        @board[x][y] = array.pop
      end
    end
  end

  def render
    @board.each do |ele_0|
      arr = []
      ele_0.each do |ele_1|
        if ele_1.face_value == true
          arr << ele_1.value
        else
          arr << "-"
        end
      end
      puts arr.join(" ")
    end
  end

  def reveal(guessed_pos)
    if !self[guessed_pos].face_value == true
      self[guessed_pos].reveal
      return self[guessed_pos].value
    end
  end

  def won?
    @board.each do |ele_0|
      ele_0.each do |ele_1|
       return false if ele_1.face_value == false
      end
    end
    true
  end

  def hidden_grid
  end



end