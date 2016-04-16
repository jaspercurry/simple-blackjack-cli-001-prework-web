def welcome
  puts "Welcome to the Blackjack Table"

  # code #welcome here
end

def deal_card
  rand(1..11)

  # code #deal_card here
end

def display_card_total(card_total)
  puts "Your cards add up to #{card_total}"
end

def prompt_user
  puts "Type 'h' to hit or 's' to stay"
  # code #prompt_user here
end

def get_user_input
  gets.chomp
end

def end_game(card_total)
  puts "Sorry, you hit #{card_total}. Thanks for playing!"
  # code #end_game here
end

def initial_round
  x = deal_card + deal_card
  display_card_total(x)
  return x
end

def hit?(x)
  prompt_user
  y = get_user_input
  if y == "h"
    deal_card + x
  elsif y == "s"
    x
  else
  invalid_command
  end
  # code hit? here
end

def invalid_command
  puts "Please enter a valid command"

  #puts
end

#####################################################
# get every test to pass before coding runner below #
#####################################################

def runner
  welcome
  card_total = initial_round
  until card_total > 21 
    card_total = hit?(card_total)
    display_card_total(card_total)
  end
   end_game(card_total)
end

runner
