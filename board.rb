class Board
  attr_accessor :board

  def initialize
    @board = [
      " ", " ", " ", 
      " ", " ", " ", 
      " ", " ", " "
    ]
  end

  def template
    puts "\n"
    puts "1 | 2 | 3"
    puts "---------"
    puts "4 | 5 | 6"
    puts "---------"
    puts "7 | 8 | 9"
    puts "\n"
  end

  def draw_board
    self.template
    puts "\n"
    puts "#{board[0]} | #{board[1]} | #{board[2]}"
    puts "---------"
    puts "#{board[3]} | #{board[4]} | #{board[5]}"
    puts "---------"
    puts "#{board[6]} | #{board[7]} | #{board[8]}"
    puts "\n"
  end

end

=begin
  def turn(symbol)
    space_chosen = gets.chomp
    p space_chosen
    space_chosen = space_chosen.to_i
    return board[space_chosen-1] = symbol
  end
=end
=begin
  def game_over?(symbol)
    if (board[0] == symbol && board[1] == symbol && board[2] == symbol) ||
      (board[3] == symbol && board[4] == symbol && board[5] == symbol) ||
      (board[6] == symbol && board[7] == symbol && board[8] == symbol) ||
    end
  end
=end