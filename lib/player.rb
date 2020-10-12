class Player
  attr_reader :name, :token

  def initialize(name, token, board)
    @name  = name
    @token = token
    @board = board
  end

  def get_coordinates
    loop do
      position = get_values

      if valid?(position)
        break if @board.place_token(@token, position)
      end
    end
  end

  private

  def get_values
    puts "😮 #{name}, enter your coordinates (x,y): "
    gets.strip.split(',').map(&:to_i)
  end

  def valid?(position)
    if position.is_a?(Array) && position.size == 2
      true
    else
      puts "💩 Woops! Bad data. Try that again."
    end
  end
end
