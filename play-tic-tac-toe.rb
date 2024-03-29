require_relative 'player.rb'
require_relative 'board.rb'

class Game 
  attr_reader :player1_turn
  attr_reader :player1_symbol
  attr_reader :player2_symbol
  attr_accessor :game_over
  attr_accessor :player1_turn

  def initialize
    @player1_symbol = 'X'
    @player2_symbol = 'O'
    @player1 = Player.new($player1_name, @player1_symbol)
    @player2 = Player.new($player2_name, @player1_symbol)
    @game_board = Board.new
    @game_over = false
    @player1_turn = true
  end

  def play
    @game_board.draw_board
    while @game_over != true
      if @game_board.game_over("") == "Tie"
        puts "Game over: Tie game!"
        @game_over = true
        return 
      end
      if @player1_turn
        puts "#{$player1_name}, make your move."
        @game_board.turn('X')
        @player1_turn = false
        if @game_board.game_over('X') == "Winner"
          @game_over = true
          puts "Game Over! #{$player1_name} wins!" 
        end
      else
        puts "#{$player2_name}, make your move."
        @game_board.turn('O')
        @player1_turn = true
        if @game_board.game_over('O') == "Winner"
          @game_over = true
          puts "Game Over! #{$player2_name} wins!" 
        end
      end
    end
  end

end

puts "\nWelcome to Tic Tac Toe via the command line! \n"
sleep (2)

puts "\nThe rules are quite simple. Find a friend (or an enemy) to play against. 
A player will be assign a symbol: X or O."
sleep (2)

puts "\nThe players will take turns marking the spaces with their symbol in a 
3×3 grid. The player who succeeds in placing three of their marks in a 
horizontal, vertical, or diagonal row is the winner.\n"
sleep(2)

puts "\nLet's get started"
sleep(2)

#player 1 inserts name and desired symbol to mark spaces
puts "\nPlayer 1, what is your name?"
$player1_name = gets.chomp
puts "\nHi #{$player1_name}. You will mark your spaces using 'X'"
sleep(2)

#player 2 inserts name and desired symbol to mark spaces
puts "\nPlayer 2, what is your name?"
$player2_name = gets.chomp
puts "\nHi #{$player2_name}. You will mark your spaces using 'O'"
sleep(2)

new_game = Game.new
new_game.play