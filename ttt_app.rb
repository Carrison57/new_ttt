require "sinatra"
require_relative "random_ai.rb"
require_relative "human.rb"
require_relative "new_tic_tac.rb"

enable :sessions

get "/" do
  erb :welcome
end

post "/name" do
  session[:name] = params[:user_name].capitalize
  redirect '/choose_ai?user_name=' + session[:name]
end

get "/choose_ai" do
  erb :choose_ai, :locals => {:welcome_message => "Welcome #{session[:name]} to tic-tac-toe. You are player 1."}
end

post "/choose_ai" do 
  session[:board] = Board.new
  # board = session[:board]
  player_1 = Human.new("X")
  session[:player_1] = player_1
  player_2 = params[:player_2]

  if player_2 == "random_ai"
    session[:p2] = RandomAI.new("O")
  else player_2 == "human"
    session[:p2] = Human.new("O")
  end
  # redirect "/play_game"

  session[:current_player] = session[:player_1]
  erb :board, :locals => {:board => session[:board].ttt_board, :current_player => session[:current_player], :player_1 => session[:player_1], :player_2 => session[:p2]}
end

get "/play_game" do
  erb :board
end

post "/play_game" do
  space = params[:space].to_i
  session[:board].update_board(space, session[:current_player].marker)
  if session[:board].game_won?(session[:current_player].marker) == true
    redirect "/win"
  elsif 
    session[:board].game_ends_in_tie? == true
    redirect "/tie"
  else
    if session[:current_player].marker == "X"
      session[:current_player] = session[:p2]
    else
      session[:current_player] = session[:player_1]
    end
    erb :board, :locals => {:board => session[:board].ttt_board, :current_player => session[:current_player], :player_1 => session[:player_1], :player_2 => session[:p2]}
  end

end



  










  # session[:board] = params[:board]    
  # session[:board] = @ttt_board
  # erb :welcome, :locals => {:board => session[:board]}

#   
# end

# Make a loop that goes through the process of playing a game. 
#Choose a player_AI. 
#Populate the board and ask the player to choose a space to play.
#Update the board after the player picks a spot to play.
#Repeat this process via the loop.  




# require "sinatra"
# require_relative "sequential_ai.rb"
# require_relative "random_ai.rb"
# require_relative "human_ai.rb"
# require_relative "board.rb"

# enable :sessions

# get "/" do
#   erb :ask_to_play
# end

# post "/output" do
#   session[:board] = Board.new
#   player_1 = params[:player_1]
#   player_2 = params[:player_2]

#   if player_1 == "console_ai"
#     session[:p1]= HumanAI.new("X")  
#   elsif player_1 == "sequential_ai"
#     session[:p1] = SequentialAI.new("X")  
#   else player_1 == "random_ai"
#     session[:p1] = RandomAI.new("X")  
#   end

#   if player_2 == "console_ai"
#     session[:p2] = HumanAI.new("O")
#   elsif player_2 == "sequential_ai"
#     session[:p2] = SequentialAI.new("O")  
#   else player_2 == "random_ai"
#     session[:p2] = RandomAI.new("O")  
#   end

#   erb :get_move, :locals => {:player_1 => session[:p1], :player_2 => session[:p2], :board => session[:board].board_with_positions}
# end

# get "/get_move" do
#   erb :get_move
# end

# post "/get_player_move" do
#   move_spot = params[:move_spot].to_i

#   session[:board].update_board((move_spot - 1), session[:p1].marker)
#   session[:board].ttt_board
#   # board_with_positions


# end