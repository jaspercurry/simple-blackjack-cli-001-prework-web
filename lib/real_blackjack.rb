def welcome
  puts "Welcome to the Blackjack Table!"
end

def display_card_total(x)
  puts "Your cards add up to #{x[1]}."
end

def deal_card
  
  hash = 
    {
      1 => [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11],
      2 => [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11],
      3 => [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11],
      4 => [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
    }
  hash[rand(1..4)].shuffle!.pop
end


def deal_card_original
  


  rand(1..11)
end


def prompt_user
  puts "Type 'h' to hit or 's' to stay."
end

def get_user_input
input = gets.chomp
end

def end_game(card_total)
  puts "Sorry, you hit #{card_total[1]}. Thanks for playing!"
end

def initial_round_player
  first = [nil, deal_card + deal_card]
  display_card_total(first)
  first
end

def initial_round_dealer
first_card = deal_card 
second_card = deal_card
puts "The dealers face up card is #{first_card}."
p2 = first_card + second_card
end

def hit?(num)
  prompt_user
  x = get_user_input.downcase
    until x == "s" || x == "h"
      invalid_command
      prompt_user
      x = get_user_input.downcase
    end
      if x == "s"
        array = ["s", num[1]]
      elsif x == "h"
        array = ["h", num[1] + deal_card]
      end
end


def dealer_hit?(num)
  while num < 17 do
    num += deal_card
  end
  num
end

def hit_fixer(player_total)
  until player_total[0] == "s" || player_total[1] > 21 do
    player_total = hit?(player_total)
      if player_total[1] < 22 
        display_card_total(player_total)
      end
  end
  player_total
end 


def logic(player_input, dealer_total)
  dealer_total = dealer_hit?(dealer_total)
      if player_input[1] > 21
        puts "You bust at #{player_input[1]}. Sad panda :("
      elsif dealer_total < 22 && dealer_total < player_input[1]
        puts "You're a winner winner chicken dinner! You got #{player_input[1]} and the dealer had #{dealer_total}!"
      elsif dealer_total > 21 
        puts "Dealer busts at #{dealer_total}! You winnnnnnnn with #{player_input[1]}!"
      elsif dealer_total < 22 && dealer_total > player_input[1]
        puts "Awe snap - the dealer wins with #{dealer_total}. Sozz."
      elsif dealer_total == player_input[1]
        puts "Well.. Would you look at that. It's a tie! #{dealer_total} each!"
      else 
        puts "Houston - we have a problem! Dealer total: #{dealer_total} player input: #{player_input}"
      end
end  

def invalid_command
  puts "Please enter a valid command!"
end

def runner
  welcome
  dealer_total = initial_round_dealer
  player_total = initial_round_player
  total = hit_fixer(player_total)
  logic(total, dealer_total)
end

runner




   