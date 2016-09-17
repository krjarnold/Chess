require 'colorize'
require_relative 'board'
require_relative 'cursorable'

class Display

  include Cursorable
  attr_reader :cursor_pos, :notifications
  attr_accessor :selected

  def initialize(board)
    @board = board
    @cursor_pos = [0, 0]
    @selected = false
    @notifications = {}
  end

  def move_cursor
    get_input
    render
  end

  def render
    system("clear")
    build_grid.each { |row| puts row.join }

    @notifications.each do |k, v|
      puts "#{v}"
    end
  end

  def reset!
    @notifications.delete(:error)
    @notifications.delete(:message)
  end

  def build_grid
    @board.rows.map.with_index do |row, i|
      build_row(row, i)
    end
  end

  def build_row(row, i)
    row.map.with_index do |piece, j|
      color_options = colors_for(i, j)
      piece.to_s.colorize(color_options)
    end
  end

  def colors_for(i, j)
    if [i, j] == @cursor_pos
      bg = :blue
    elsif (i + j).odd?
      bg = :light_black
    else
      bg = :light_cyan
    end
    { background: bg, color: :light_white }
  end


end

# a= Board.new
# p a.populate
# b= Display.new(a)
# b.render
# b.move_cursor
