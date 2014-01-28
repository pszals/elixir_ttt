defmodule GameRulesTest do
  use ExUnit.Case

  test "determines whose turn it is" do
    assert(GameRules.whose_turn(["x", 2, 3, 4, 5, 6, 7, 8, 9], "x", "o") == "o")
    assert(GameRules.whose_turn(["x", "o", 3, 4, 5, 6, 7, 8, 9], "x", "o") == "x")
  end

  test "determines if there is a row of the same piece" do
    assert(GameRules.all_same?(["x", "x", "x"]) == true)
    assert(GameRules.all_same?(["o", "o", "o"]) == true)
    assert(GameRules.all_same?(["R", "R", "R", "R"]) == true)

    assert(GameRules.all_same?(["x", "o", "x"]) == false)
    assert(GameRules.all_same?(["x", 2, "x"]) == false)
  end

  test "determines if there is a winner one the board" do
    assert(GameRules.winner_on_board?(["x", "x", "x", "o", "o", 6, 7, 8, 9]) == true)
    assert(GameRules.winner_on_board?(["x", 2, 3, 4, 5, 6, 7, 8, 9]) == false)
  end

  test "determines the winning piece if a winner is on board" do
    assert(GameRules.winning_piece(["x", "x", "x", "o", "o", 6, 7, 8, 9]) == "x")
    assert(GameRules.winning_piece(["o", "o", "o", "x", "x", 6, 7, 8, 9]) == "o")
  end

  test "creates list of winning combinations" do
    assert(GameRules.winning_combinations([1, 2, 3, 4, 5, 6, 7, 8, 9]) ==
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
end
