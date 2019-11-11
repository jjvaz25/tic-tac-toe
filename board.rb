require_relative 'player.rb'

class Board
  attr_accessor :board
  attr_reader :winning_combos

  def initialize
    @board = [
      " ", " ", " ", 
      " ", " ", " ", 
      " ", " ", " "
    ]
    @winning_combos = [
      [0,1,2], [3,4,5], [6,7,8], #horzontal wins
      [0,3,6], [1,4,7], [2,5,8], #vertical wins
      [0,4,8], [2,4,6]          #diag wins
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
    puts "\nYou can use the below template to select your move. Simply choose the 
    number that coincides with your desired square"
    self.template
    puts "\n"
    puts "#{@board[0]} | #{@board[1]} | #{@board[2]}"
    puts "---------"
    puts "#{@board[3]} | #{@board[4]} | #{@board[5]}"
    puts "---------"
    puts "#{@board[6]} | #{@board[7]} | #{@board[8]}"
    puts "\n"
  end

  def turn (marker_symbol)
    move = gets.chomp.to_i
    @board[move - 1] = marker_symbol
    self.draw_board
  end

  def game_over(marker)
    @winning_combos.each do |combo|
      match = combo.all? do |spot|
        board[spot] == marker
      end
      if match 
        return "Winner"
      end
    end
    full_board = @board.all? do |spot|
      spot != " "
    end
    if full_board == true 
      return "Tie"
    end
    
  end

end
