class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    puts "Welcome to Simon!"
    sleep(3)
    system("clear")
    while !@game_over
      take_turn
    end
    puts "Goodbye."
  end

  def take_turn
    show_sequence
    require_sequence
    if !@game_over
      round_success_message
      @sequence_length += 1
      sleep(2)
      system("clear")
    else
      game_over_message
      reset_game
    end
  end

  def show_sequence
    add_random_color
    @seq.each do |color|
      puts "Watch very carefully..."
      sleep(1)
      puts color
      sleep(1)
      system("clear")
    end
  end

  def require_sequence
    puts "Please enter the sequence (separate with spaces):"
    input = gets.chomp.split(" ")
    if input != @seq
      @game_over = true
    end
  end

  def add_random_color
    @seq << COLORS.sample
  end

  def round_success_message
    puts "\nCongratulations! You win this round."
  end

  def game_over_message
    puts "\nWRONG! Game Over. Your score was #{sequence_length}."
  end

  def reset_game
    print "Enter \"y\" to play again: "
    input = gets.chomp
    if input == "y"
      @sequence_length = 1
      @game_over = false
      @seq = []
    end
  end
end

a = Simon.new
a.play