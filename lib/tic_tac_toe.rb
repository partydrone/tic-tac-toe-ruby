require_relative 'board'
require_relative 'player'

class TicTacToe
  def initialize
    @board          = Board.new
    @player_1       = Player.new('Player 1', :x, @board)
    @player_2       = Player.new('Player 2', :o, @board)
    @current_player = @player_1
  end

  def run
    @board.draw

    loop do
      @current_player.get_coordinates
      @board.draw

      break if game_over?

      switch_player
    end
  end

  private

  def did_players_tie?
    if @board.full?
      puts "😐 Looks like a tie."
      true
    else
      false
    end
  end

  def did_player_win?
    if @board.winner?(@current_player.token)
      @current_player.score += 1
      puts "🎉 #{@current_player.name} wins!\n"
      puts "🎯 #{@player_1.name}: #{@player_1.score} wins | #{@player_2.name}: #{@player_2.score} wins\n"
      true
    else
      false
    end
  end

  def game_over?
    did_player_win? || did_players_tie?
  end

  def switch_player
    @current_player = if @current_player == @player_1
      @player_2
    else
      @player_1
    end
  end
end

game = TicTacToe.new
game.run
