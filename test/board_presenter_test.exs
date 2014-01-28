defmodule BoardPresenterTest do
  use ExUnit.Case
  import BoardPresenter

  test "displays 3x3 board" do
    assert(format_board(["RR",2,3,4,"x",6,7,8,9]) == 
    "  RR |  2  |  3  \n" <>
    "-----+-----+-----\n" <>
    "  4  |  x  |  6  \n" <>
    "-----+-----+-----\n" <>
    "  7  |  8  |  9  ")
  end
    
  test "displays 4x4 board" do
    assert(format_board(["QQ",2,3,4,5,6,7,8,9,10,11,12,13,14,15,16]) == 
    "  QQ |  2  |  3  |  4  \n" <>
    "-----+-----+-----+-----\n" <>
    "  5  |  6  |  7  |  8  \n" <>
    "-----+-----+-----+-----\n" <>
    "  9  |  10 |  11 |  12 \n" <>
    "-----+-----+-----+-----\n" <>
    "  13 |  14 |  15 |  16 ")
  end
end
