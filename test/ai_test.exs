defmodule AiTest do
  use ExUnit.Case
  import Ai
  
  test "scores a winning board" do
    assert(score_board(["x", "x", "x", "o", "o", 6, 7, 8, 9], "x") == 1)
  end

  test "scores a losing board" do
    assert(score_board(["x", "x", "x", "o", "o", 6, 7, 8, 9], "o") == -1)
  end

  test "scores a tie" do
    assert(score_board(["x","x","o",
                       "o","o","x",
                       "x","x","o"], "x") == 0)
  end

  test "generates next level of moves given a piece and board" do
    assert(generate_next_level("o", ["x","x","o","o","o","x","x", 8,  9]) == 
                       [["x","x","o","o","o","x","x","o",9], 
                      ["x","x","o","o","o","x","x",8,"o"]]) 
    assert(generate_next_level("x", ["x","x","o","o","o","x","x","o",9]) == [["x","x","o","o","o","x","x","o","x"]])
  end

  test "minimax for a tie" do
#   assert(minimax(["x","x","o",
#                   "o","o","x",
#                   "x", "x",  9], true, 1, "x", "o") == 0)
  end

# test "generates a list of maps with the square as the key and the score as the value" do
#   assert(moves_with_scores(["x","x","o","o","o","x","x", 8,  9]) == [{8, 0}, {9, 0}])
# end
end
