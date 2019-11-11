#left to go surf at 2:20. Right now we have player 1 going first and playing 2 going second. Their answers populate the grid. But we need to determine game over.

require_relative 'player.rb'
require_relative 'board.rb'

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

new_game = Game.new
new_game.play








=begin
class PlayGame

  def goes_first
    player1_goes_first = true
    puts "We need to decide who makes the first move."
    random_number = rand(1..2)
    puts "#{$player1_name}, choose a number: 1 or 2"
    chosen_number = gets.chomp
    puts "#{$player1_name} chose #{chosen_number}. We randomly generated the
    number: #{random_number}"
    chosen_number = chosen_number.to_i
    if chosen_number == random_number
      puts "#{$player1_name} chose correctly! Do you want to go first or second?
      Type 1 or 2"
      answer = gets.chomp
      player1_goes_first = false if answer == "2"
    else
      puts "#{$player1_name} chose incorrectly! #{$player2_name} do you want to go
      first or second? Type 1 or 2"
      answer = gets.chomp
      player1_goes_first = false if answer == "1"
    end
  end

  def play_until_over
    game_over = false
    while game_over == false
      puts "#{$player1_name}, please choose your space"
      $game_board.turn($player1_symbol)
      $game_board.draw_board
      $game_board.game_over?($player1_symbol)
      game_over = true if $game_board.game_over?($player1_symbol)
      puts "#{$player2_name}, please choose your space"
      $game_board.turn($player2_symbol)
      $game_board.draw_board
      $game_board.game_over?($player2_symbol)
      game_over = true if $game_board.game_over?($player2_symbol)
    end
  end

end


#intro
=begin
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
puts "\nHi #{$player1_name}. What symbol do you want to use to mark your spaces?"
$player1_symbol = gets.chomp
puts "Okay #{$player1_name} will mark their spaces with '#{$player1_symbol}'"
sleep(2)

#player 2 inserts name and desired symbol to mark spaces
puts "\nPlayer 2, what is your name?"
$player2_name = gets.chomp
puts "\nHi #{$player2_name}. What symbol do you want to use to mark your spaces?"
$player2_symbol = gets.chomp
puts "Okay #{$player2_name} will mark their spaces with '#{$player2_symbol}'"


#defining player classes and who makes first move
$player1 = Player.new($player1_name, $player1_symbol)
$player2 = Player.new($player2_name, $player2_symbol)
new_game = PlayGame.new
#new_game.goes_first

#showing the board
$game_board = Board.new
$game_board.draw_board

#begin playing
new_game.play_until_over

=end