class Board
  def initialize
    @board = Array.new(3) { Array.new(3) }
  end

  def draw
    puts

    @board.each do |row|
      row.each do |cell|
        if cell.nil?
          print '-'
        else
          print(cell.to_s)
        end
      end

      puts
    end

    puts
  end

  def full?
    @board.all? do |row|
      row.none?(&:nil?)
    end
  end

  def place_token(token, position)
    x, y = position

    if valid?(position)
      @board[x][y] = token
      true
    else
      false
    end
  end

  def winner?(token)
    win_across?(token) || win_diagonally?(token) || win_down?(token)
  end

  private

  def available?(position)
    x, y = position

    if @board[x][y].nil?
      true
    else
      puts "😡 ¡Ocupado! Pick a different spot."
    end
  end

  def columns
    [
      [@board[0][0], @board[0][1], @board[0][2]],
      [@board[1][0], @board[1][1], @board[1][2]],
      [@board[2][0], @board[2][1], @board[2][2]]
    ]
  end

  def diagonals
    [
      [@board[0][0], @board[1][1], @board[2][2]],
      [@board[0][2], @board[1][1], @board[2][0]]
    ]
  end

  def in_bounds?(position)
    x, y = position

    if (0..2).include?(x) && (0..2).include?(y)
      true
    else
      puts "🚨 Out of bounds! Try again."
    end
  end

  def rows
    [
      [@board[0][0], @board[1][0], @board[2][0]],
      [@board[0][1], @board[1][1], @board[2][1]],
      [@board[0][2], @board[1][2], @board[2][2]]
    ]
  end

  def valid?(position)
    if in_bounds?(position)
      available?(position)
    end
  end

  def win_across?(token)
    rows.any? do |row|
      row.all? { |cell| cell == token }
    end
  end

  def win_diagonally?(token)
    diagonals.any? do |diagonal|
      diagonal.all? { |cell| cell == token }
    end
  end

  def win_down?(token)
    columns.any? do |column|
      column.all? { |cell| cell == token }
    end
  end
end
