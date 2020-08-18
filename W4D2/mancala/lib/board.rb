
class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14) {Array.new}
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    @cups.each_with_index do |sub_arr, idx|
      if idx != 6 && idx != 13
        4.times { sub_arr << :stone }
      end
    end
  end

  def valid_move?(start_pos)
    if start_pos < 0 || start_pos > 12
      raise "Invalid starting cup"
    elsif @cups[start_pos].empty?
      raise "Starting cup is empty"
    end
  end
  
  def make_move(start_pos, current_player_name)
    current_cup_stone = @cups[start_pos]
    @cups[start_pos] = []
    cup_idx = start_pos
    until current_cup_stone.empty?
      cup_idx = (cup_idx + 1)
      cup_idx = 0 if cup_idx > 13

      if cup_idx == 6
        @cups[cup_idx] << current_cup_stone.shift if current_player_name == @name1
      elsif cup_idx == 13
        @cups[cup_idx] << current_cup_stone.shift if current_player_name == @name2
      else
        @cups[cup_idx] << current_cup_stone.shift
      end

    end

    render
    next_turn(cup_idx)
  end
  
  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    if (ending_cup_idx == 6) || (ending_cup_idx == 13)
      return :prompt
    elsif @cups[ending_cup_idx].length == 1
      return :switch
    else
      return ending_cup_idx
    end
  end
  
  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end
  
  def one_side_empty?
    (0..5).all? { |i| @cups[i].empty? } || (7..12).all? { |i| @cups[i].empty? }
  end

  def winner
    return :draw if @cups[6].length == @cups[13].length
      
    if @cups[6].length > @cups[13].length
      return @name1
    else
      return @name2
    end
  end

end
