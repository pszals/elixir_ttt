defmodule BoardTest do
  use ExUnit.Case
  import Board

  test "creates a board when given a width" do
    assert(create_board(3) == [1,2,3,4,5,6,7,8,9])
    assert(create_board(4) == [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16])
  end

  test "determines if a square is empty" do
    assert(square_empty?(["x", "x", "x", "o", "o", 6, 7, 8, 9], 3) == false)
    assert(square_empty?(["x", "x", "x", "o", "o", 6, 7, 8, 9], 9) == true)
  end

  test "places a piece on the board" do
    assert(place_piece(["x", "x", "x", "o", "o", 6, 7, 8, 9], 6, "o") ==
      ["x", "x", "x", "o", "o", "o", 7, 8, 9])
  end

  test "removes a piece from the board" do
    assert(remove_piece(["x", "x", "x", "o", "o", 6, 7, 8, 9], 0) == [1, "x", "x", "o", "o", 6, 7, 8, 9])
  end

  test "creates list of empty squares" do
    assert(empty_squares([1,2,3,4,5,6,7,8,"x"]) == [1,2,3,4,5,6,7,8])
  end

  test "determines if board is full" do
    assert(board_full?(["x", "x", "x", "o", "o", 6, 7, 8, 9]) == false)
    assert(board_full?(["x","x","o",
                       "o","o","x",
                       "x","x","o"]) == true)
  end

  test "determines if board is empty" do
    assert(board_empty?([1,2,3,4,5,6,7,8,9]) == true)
  end

  test "creates list of rows" do
    assert(rows([1,2,3,4,5,6,7,8,9]) == [[1,2,3], [4,5,6], [7,8,9]])
    assert(rows([1,2,3,4,"x",6,7,8,9]) == [[1,2,3], [4,"x",6], [7,8,9]])
  end

  test "creates list of columns" do
    assert(columns([1,2,3,4,5,6,7,8,9]) == [[1, 4, 7], [2, 5, 8], [3, 6, 9]])
    assert(columns([1,2,3,4,5,6,7,8,"x"]) == [[1, 4, 7], [2, 5, 8], [3, 6, "x"]])
  end

  test "creates list of diagonals" do
    assert(diagonals([1,2,3,4,5,6,7,8,9]) == [[1, 5, 9], [3, 5, 7]])
    assert(diagonals(["x",2,3,4,5,6,7,8,9]) == [["x", 5, 9], [3, 5, 7]])
  end
end
