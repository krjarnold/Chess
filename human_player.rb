require_relative 'display'
require_relative 'player'
require 'byebug'

class HumanPlayer < Player

    def make_move(board)
      start_pos, end_pos = nil, nil
      until start_pos && end_pos
          if start_pos
            until display.selected
              display.move_cursor
            end
            end_pos = display.cursor_pos
            display.selected = false
            display.reset! if end_pos
            
          else
            until display.selected
              display.move_cursor
            end
            start_pos = display.cursor_pos
            display.selected = false
            display.reset! if start_pos
            @display.notifications[:message] = "#{color.capitalize}'s turn.  Where would you like to move to?"
          end
        end
        [start_pos, end_pos]
    end

end
