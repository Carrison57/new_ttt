class Board

	attr_accessor :ttt_board
	def initialize()
		@ttt_board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
	end

	def update_board(position, marker)
		ttt_board[position] = marker
	end

	def valid_space?(position)
	ttt_board[position] == " " && position >= 0 && position <= 8
	end

	def game_ends_in_tie?
		ttt_board.count(" ") == 0
	end

	def game_won?(marker)
		ttt_board[6] == marker && ttt_board[7] == marker && ttt_board[8] == marker || 
		ttt_board[0] == marker && ttt_board[1] == marker && ttt_board[2] == marker ||
		ttt_board[3] == marker && ttt_board[4] == marker && ttt_board[5] == marker ||
		ttt_board[0] == marker && ttt_board[3] == marker && ttt_board[6] == marker ||
		ttt_board[1] == marker && ttt_board[4] == marker && ttt_board[7] == marker ||
		ttt_board[2] == marker && ttt_board[5] == marker && ttt_board[8] == marker
	end
end