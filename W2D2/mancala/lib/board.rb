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
    @cups.each_index do |i|
      next if i == 6 || i == 13
      4.times do
        @cups[i] << :stone
      end
    end
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" unless start_pos.between?(0,13)
    raise "Invalid starting cup" if @cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    opponent_cup = current_player_name == @name1 ? 13 : 6
    stones = @cups[start_pos].count
    @cups[start_pos] = []

    (1..stones).each do |num|
      next if (start_pos + num)%13 == opponent_cup
      @cups[(start_pos + num)%13] << :stone
    end

    render
    next_turn((start_pos + stones) % 14)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine what #make_move returns
    if @cups[ending_cup_idx].count == 1
      return :switch
    elsif ending_cup_idx == 6 || ending_cup_idx == 13
      return :prompt
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
    @cups[0..5].all? {|cup| cup.empty?} || @cups[7..12].all? {|cup| cup.empty?}
  end

  def winner
    if @cups[6] == @cups[13]
      return :draw
    else
      return @cups[6].count > @cups[13].count ? @name1 : @name2
    end
  end
end
