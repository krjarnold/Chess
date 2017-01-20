require_relative 'components/board'
require_relative 'components/human_player'


class Game
  attr_reader :board, :display, :current_player_color, :players

  def initialize
    @board = Board.new
    @display = Display.new(@board)
    @players = {
      white: HumanPlayer.new(:white, @display),
      black: HumanPlayer.new(:black, @display)
    }
    @current_player_color = :white
  end

  def play
    board.populate
    ##Counts for testing purposes
    count = 0
    until count == 1000
      begin
        @display.notifications[:message] = "#{current_player_color.capitalize}'s turn.  What piece would you like to move?"
        display.render
        start_pos, end_pos = players[current_player_color].make_move(board)
        board.move(current_player_color, start_pos, end_pos)
        display.render

        swap_players
      rescue StandardError => e
        @display.notifications[:error] = e.message
        display.render
        sleep(1)
        retry
      end
      count += 1
    end
    display.render
    puts "end of testing"
  end


private

  def swap_players
    @current_player_color = (current_player_color == :white) ? :black : :white
  end

end

if __FILE__ == $PROGRAM_NAME
  Game.new.play
end
