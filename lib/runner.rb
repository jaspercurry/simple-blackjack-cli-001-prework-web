require_relative "blackjack.rb"

def runner
  welcome
  initial_round

  prompt_user
  hit?
end

runner
