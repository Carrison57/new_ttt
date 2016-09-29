require "minitest/autorun"
require_relative "unbeatable_ai.rb"

class TestUnbeatableAI < MiniTest::Test

	def test_for_player_marker
		player = UnbeatableAI.new("X")
		assert_equal("X", player.marker)
	end

	def test_choose_a_move
		player = UnbeatableAI.new("X")
		move = player.get_move([" ", " ", " ", " ", " ", " ", " ", " ", " "])
		assert_equal(true, [0, 1, 2, 3, 4, 5, 6, 7, 8].include?(move))
	end
end