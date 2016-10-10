def tic_tac_toe(board)

# board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

 	puts " #{board[0]} | #{board[1]} | #{board[2]} "
 	puts "-----------"
 	puts " #{board[3]} | #{board[4]} | #{board[5]} "
 	puts "-----------"
 	puts " #{board[6]} | #{board[7]} | #{board[8]} "
 	puts
 end


def ask_to_play_game()
	puts "Welcome to Tic Tac Toe. Would you like to play a game?"

	answer = gets.chomp
	if answer.upcase != "YES"
		puts "Ok, goodbye"
		exit
	end
end

def player_1_marker()
	puts "Player one choose 'X' or 'O'"
	player_1_choice = gets.chomp
	if player_1_choice.upcase == "X"
		puts "Player one chose X"
		puts "Player two is O"
	elsif player_1_choice.upcase == "O"
		puts "Player one chose O"
		puts "Player two is X"
	else 
		puts "Choose again"
		# player_1_choice
		player_1_marker()
	end
end

def player_2_marker(p1)
	if p1 == "X"
		"O"
	else 
		"X"
	end
end

def choose_space_to_play(board)
	puts "Please choose a space to play from 1 to 9."
	tic_tac_toe(board)
	user_input = (gets.chomp.to_i) -1
	# if user_input >= 1 && user_input <=9
	# 	user_input
	# else
	# 	"That was not a valid number. Please choose a number from 1 to 9."
	# end
	if user_input.between?(0, 8)
		user_input
	else
		puts "That was not a valid number. Please choose a number from 1 to 9."
	end
end