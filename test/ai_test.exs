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
end
