defmodule BoardTest do
  use ExUnit.Case

  test "creates a board when given a width" do
    assert(Board.create_board(3) == [1,2,3,4,5,6,7,8,9])
    assert(Board.create_board(4) == [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16])
  end

  test "determines if a square is empty" do
    assert(Board.square_empty?(["x", "x", "x", "o", "o", 6, 7, 8, 9], 3) == false)
    assert(Board.square_empty?(["x", "x", "x", "o", "o", 6, 7, 8, 9], 9) == true)
  end

  test "places a piece on the board" do
    assert(Board.place_piece(["x", "x", "x", "o", "o", 6, 7, 8, 9], 6, "o") ==
      ["x", "x", "x", "o", "o", "o", 7, 8, 9])
  end

  test "creates list of empty squares" do
    assert(Board.empty_squares([1,2,3,4,5,6,7,8,"x"]) == [1,2,3,4,5,6,7,8])
  end

  test "determines if board is full" do
    assert(Board.board_full?(["x", "x", "x", "o", "o", 6, 7, 8, 9]) == false)
  end

  test "creates list of rows" do
    assert(Board.rows([1,2,3,4,5,6,7,8,9]) == [[1,2,3], [4,5,6], [7,8,9]])
    assert(Board.rows([1,2,3,4,"x",6,7,8,9]) == [[1,2,3], [4,"x",6], [7,8,9]])
  end

  test "creates list of columns" do
    assert(Board.columns([1,2,3,4,5,6,7,8,9]) == [[1, 4, 7], [2, 5, 8], [3, 6, 9]])
    assert(Board.columns([1,2,3,4,5,6,7,8,"x"]) == [[1, 4, 7], [2, 5, 8], [3, 6, "x"]])
  end

  test "creates list of diagonals" do
    assert(Board.diagonals([1,2,3,4,5,6,7,8,9]) == [[1, 5, 9], [3, 5, 7]])
    assert(Board.diagonals(["x",2,3,4,5,6,7,8,9]) == [["x", 5, 9], [3, 5, 7]])
  end
end
