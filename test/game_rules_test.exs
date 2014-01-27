defmodule GameRulesTest do
  use ExUnit.Case

  test "determines if there is a winner" do
    assert(GameRules.all_same?(["x", "x", "x"]) == true)
    assert(GameRules.all_same?(["o", "o", "o"]) == true)
    assert(GameRules.all_same?(["R", "R", "R", "R"]) == true)

    assert(GameRules.all_same?(["x", "o", "x"]) == false)
    assert(GameRules.all_same?(["x", 2, "x"]) == false)
  end

  test "determines whose turn it is" do
    assert(GameRules.whose_turn(["x", 2, 3, 4, 5, 6, 7, 8, 9], "x", "o") == "o")
    assert(GameRules.whose_turn(["x", "o", 3, 4, 5, 6, 7, 8, 9], "x", "o") == "x")
  end

  test "determines if there is a winner one the board" do
    assert(GameRules.winner_on_board?(["x", "x", "x", "o", "o", 6, 7, 8, 9]) == true)
    assert(GameRules.winner_on_board?(["x", 2, 3, 4, 5, 6, 7, 8, 9]) == false)
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

  test "creates list of rows" do
    assert(GameRules.rows([1,2,3,4,5,6,7,8,9]) == [[1,2,3], [4,5,6], [7,8,9]])
    assert(GameRules.rows([1,2,3,4,"x",6,7,8,9]) == [[1,2,3], [4,"x",6], [7,8,9]])
  end

  test "creates list of columns" do
    assert(GameRules.columns([1,2,3,4,5,6,7,8,9]) == [[1, 4, 7], [2, 5, 8], [3, 6, 9]])
    assert(GameRules.columns([1,2,3,4,5,6,7,8,"x"]) == [[1, 4, 7], [2, 5, 8], [3, 6, "x"]])
  end

  test "creates list of diagonals" do
    assert(GameRules.diagonals([1,2,3,4,5,6,7,8,9]) == [[1, 5, 9], [3, 5, 7]])
    assert(GameRules.diagonals(["x",2,3,4,5,6,7,8,9]) == [["x", 5, 9], [3, 5, 7]])
  end
end
