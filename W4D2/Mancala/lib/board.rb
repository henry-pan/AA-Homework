class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14) { Array.new }
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    (0..5).each { |cup| @cups[cup] = [:stone, :stone, :stone, :stone]}
    (7..12).each { |cup| @cups[cup] = [:stone, :stone, :stone, :stone]}
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" if start_pos < 0 || start_pos > 12 || start_pos == 6 
    raise "Starting cup is empty" if @cups[start_pos].length == 0
    true
  end

  def make_move(start_pos, current_player_name)
    stones = @cups[start_pos].length
    @cups[start_pos] = []

    i = start_pos
    while stones != 0
      i = (i + 1) % 14

      # !a && !b == a || b
      if !(current_player_name != @name1 && i == 6) && !(current_player_name != @name2 && i == 13)
        @cups[i] << :stone
        stones -= 1
      end
    end

    render
    next_turn(i)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    if ending_cup_idx == 6 || ending_cup_idx == 13
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
    (0..5).all? { |i| @cups[i].length == 0 } || (7..12).all? { |i| @cups[i].length == 0 }
  end

  def winner
    score_1 = @cups[6].length
    score_2 = @cups[13].length

    if score_1 == score_2
      return :draw
    else
      return score_1 > score_2 ? @name1 : @name2
    end
  end
end
