


module MineSweeper

  class Game

    def play(input_positions)
      output = ""
      field = 1
      iterator = input_positions.each_line
      loop do
        header = iterator.next.split
        lines,columns = header[0].to_i, header[1].to_i
        break if lines == 0 || columns == 0
        lines.times { iterator.next }
        board = get_board(field,lines,columns)
        output << "\n" if field > 1
        field += 1
        output << board.to_s
      end
      output
    end

    private
    
    def get_board(field, lines, columns)
      Board.new field,lines,columns
    end


  end

  class Board

    attr_reader :field, :lines, :columns
    
    def initialize(field, lines, columns, string_board=nil)
      @lines = lines
      @columns = columns
      @field = field
      @string_board = string_board || default_string_board
    end

    def to_s
      output = "Field ##{@field}:\n"
      output << result_board
      output
    end

    def [](line,column)
      @string_board[index(line,column)]
    end

    def []=(line,column,value)
      @string_board[index(line,column)] = value
    end

    def index(line,column)
      line * (@columns+1) + column
    end

    private

    def result_board
      0.upto(@lines-1) do |line|
        0.upto(@columns-1) do |column|
          cell = self[line,column]
          #self[lines,column] = "f"
        end
      end
      @string_board
    end

    def default_string_board
      output = ""
      @lines.times { output << "." * @columns << "\n" }
      output
    end



  end

end