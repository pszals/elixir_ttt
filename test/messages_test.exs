defmodule MessagesTest do
  use ExUnit.Case

  test "welcomes player to game" do
  end

  test "asks for marker types" do
  end

  test "asks which marker goes first" do
  end

  test "announces whose turn it is" do
  end

  test "displays board" do
    assert(Messages.display_board([1,2,3,4,5,6,7,8,9]) == 
    "  1  |  2  |  3  \n" <>
    "-----+-----+-----\n" <>
    "  4  |  5  |  6  \n" <>
    "-----+-----+-----\n" <>
    "  7  |  8  |  9  \n")
    
    assert(Messages.display_board([1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16]) == 
    "  1  |  2  |  3  |  4  \n" <>
    "-----+-----+-----+-----\n" <>
    "  5  |  6  |  7  |  8  \n" <>
    "-----+-----+-----+-----\n" <>
    "  9  |  10 |  11 |  12 \n" <>
    "-----+-----+-----+-----\n" <>
    "  13 |  14 |  15 |  16 \n")
  end

  test "asks for input/square to mark" do
  end

  test "gives error message if square is not empty" do
  end

  test "gives error message if input is not a number" do
  end

  test "announces end of game" do
  end

  test "announces winner of game" do
  end

  test "announces tie game" do
  end

  test "asks to replay or exit game" do
  end
end