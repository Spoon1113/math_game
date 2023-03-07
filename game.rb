require './players'
require './questions'

class Game

def initialize
  @game_over = false
  puts "Enter Player One Name"
  p1 = gets.chomp
  @p1 = Player.new(p1)
  puts "Enter Player Two Name"
  p2 = gets.chomp
  @p2 = Player.new(p2)

  @current_player = @p1
end 

def change_player
  if @current_player == @p1
    @current_player = @p2
  else 
    @current_player = @p1  
  end
end

def remaining_life
  puts "#{@p1.name}: #{@p1.lives} / 3 vs #{@p2.name}: #{@p2.lives} / 3"
end


def start_match
  until @game_over do 
    puts "-- New Turn -- "
    new_question = Questions.new
    new_question.ask_question(@current_player.name)
    ans = gets.chomp
    if(new_question.correct_answer?(ans))
      puts "Wao you got it right #{@current_player.name}"
      remaining_life
    else
      puts "Das wrong Doopid"
      @current_player.lose_life
      remaining_life
  if @current_player.lives < 1
    puts "-- GG -- "
    @game_over = true
    change_player
    puts "#{@current_player.name} wins with a score of #{@current_player.lives}/3"
    end
  end
    change_player
    end
  end
end
