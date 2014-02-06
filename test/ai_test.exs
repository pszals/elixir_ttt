defmodule AiTest do
  use ExUnit.Case
  import Ai
  
  test "scores a winning board" do
    assert(score_board(["x","x","x", 
                        "o","o", 6, 
                         7,  8,  9], "x") == 1)
  end

  test "scores a losing board" do
    assert(score_board(["x","x","x",
                        "o","o", 6,
                         7,  8,  9], "o") == -1)
  end

  test "scores a tie" do
    assert(score_board(["x","x","o",
                        "o","o","x",
                        "x","x","o"], "x") == 0)
  end

  test "generates next level of moves given a piece and board" do
    assert(generate_next_level("o", ["x","x","o",
                                     "o","o","x",
                                     "x", 8,  9]) == 
                                                     [["x","x","o",
                                                       "o","o","x",
                                                       "x","o", 9], 
                                                      ["x","x","o",
                                                       "o","o","x",
                                                       "x", 8, "o"]]) 
    assert(generate_next_level("x", ["x","x","o",
                                     "o","o","x",
                                     "x","o", 9]) == [["x","x","o","o","o","x","x","o","x"]])
  end

  test "negamax for a tie" do
    assert(negamax(["x","o","o",
                    "o","o","x",
                    "x","x", 9], 1, "o", "x") == 0)
  end

  test "negamax for a loss" do
    assert(negamax(["x","o","o",
                    "o","o","x",
                    "x","x","x"], 1, "o", "x") == 1)
  end

  test "negamax for a win" do
    assert(negamax(["o","o","o",
                    "o","x","x",
                    "x","o","o"], 1, "o", "x") == -1)
  end

  test "generates a list of maps with the square as the key and the score as the value" do
    assert(squares_with_scores(["x","x","o",
                                "o","o","x",
                                "x","o", 9], "x", "o") == [{9, 0}])

    assert(squares_with_scores([ 1, "x","o",
                                "o","o","x",
                                "x","o","x"], "x", "o") == [{1, 0}])

    assert(squares_with_scores([ 1, "o","o",
                                "o","x","x",
                                "x","o","x"], "x", "o") == [{1, 1}])

    assert(squares_with_scores([ 1,  2, "o",
                                "o","o","x",
                                "x","o","x"], "x", "o") == [{1, -0.5}, {2, 0}])
  end

  test "blocks a fork" do
     assert(squares_with_scores([ 1, 2,"o",
                                  4,"x",6,
                                 "o",8, 9], "x", "o") == [{1, -0.25}, {2, 0.0}, {4, 0.0}, {6, 0.0}, {8, 0.0}, {9, -0.25}])
  end

  test "picks a corner when board is empty" do
    assert(squares_with_scores([1,2,3,4,5,6,7,8,9], "x", "o") == [{3, 1}])
  end
  
  test "blocks a fork with best move" do
    assert(best_square([ 1, 2,"o",
                         4,"x",6,
                        "o",8, 9], "x", "o") == 2)
  end

  test "gets best square for x" do
    assert(best_square([ 1,  2,  3,
                        "o","o", 6,
                        "x","x", 9], "x", "o") == 9)
  end
  
  test "wins instead of blocking" do
    assert(best_square([ 1,  2,  3,
                        "x","x", 6,
                        "o","o", 9], "o", "x") == 9)
  end
  
  test "gets key with max value" do
    assert(max_value([{:a, 1}, {:b, 99}]) == :b)
  end
end
