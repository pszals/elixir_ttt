defmodule GameRulesTest do
  use ExUnit.Case
  import GameRules

  test "determines whose turn it is" do
    assert(whose_turn(["x", 2, 3, 4, 5, 6, 7, 8, 9], "x", "o") == "o")
    assert(whose_turn(["x", "o", 3, 4, 5, 6, 7, 8, 9], "x", "o") == "x")
  end

  test "determines if there is a row of the same piece" do
    assert(all_same?(["x", "x", "x"]) == true)
    assert(all_same?(["o", "o", "o"]) == true)
    assert(all_same?(["R", "R", "R", "R"]) == true)

    assert(all_same?(["x", "o", "x"]) == false)
    assert(all_same?(["x", 2, "x"]) == false)
  end

  test "determines if there is a winner on the board" do
    assert(winner_on_board?(["x", "x", "x", "o", "o", 6, 7, 8, 9]) == true)
    assert(winner_on_board?(["x", 2, 3, 4, 5, 6, 7, 8, 9]) == false)
    assert(winner_on_board?(["x", 2, 3, "x", 5, 6, "x", 8, 9]) == true)
  end

  test "determines the winning piece if a winner is on board" do
    assert(winning_piece(["x", "x", "x", "o", "o", 6, 7, 8, 9]) == "x")
    assert(winning_piece(["o", "o", "o", "x", "x", 6, 7, 8, 9]) == "o")
  end

  test "creates list of winning combinations" do
    assert(winning_combinations([1, 2, 3, 4, 5, 6, 7, 8, 9]) ==
      [
        [1, 2, 3],
        [4, 5, 6],
        [7, 8, 9],
        [1, 4, 7],
        [2, 5, 8],
        [3, 6, 9],
        [1, 5, 9],
        [3, 5, 7]
      ]) 
  end

  test "knows when game is over" do
    assert(game_over?([1,2,3,4,5,6,7,8,9]) == false)
    assert(game_over?(["x", "x", "x", "o", "o", 6, 7, 8, 9]) == true)
    assert(game_over?(["x","x","o",
                       "o","o","x",
                       "x","x","o"]) == true)
  end
end
