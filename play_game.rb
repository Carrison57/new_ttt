require_relative "console_game.rb"

p1 = Human.new("X")
p2 = Human.new("O")
game = ConsoleGame.new(p1, p2)

# array = [1, 2, 3, 4, 5, 6, 7, 8, 9]

game.start_game()
game.board_status()
until game.game_over?
	game.change_player
	move = game.get_player_move
	game.make_move(move)
	game.board_status
end

