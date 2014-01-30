defmodule ValidationsTest do
  use ExUnit.Case
  import Validations

  test "validates a response for 'yes'" do
    assert(yes_or_no?("y") == true)
    assert(yes_or_no?("yes") == true)
  end

  test "validates a response for 'no'" do
    assert(yes_or_no?("n") == true)
    assert(yes_or_no?("no") == true)
  end

  test "validates a response for 'asdfp09u'" do
    assert(yes_or_no?("asdfp09u") == false)
  end

  test "validates if selection is available" do
    assert(valid_move?("3", [1,2,3,4,5,6,7,8,9]) == true)
    assert(valid_move?("1", ["x",2,3,4,5,6,7,8,9]) == false)
  end

  test "validates if marker type entered is acceptable" do
    assert(valid_marker?("i", nil) == true)
    assert(valid_marker?("xo", "xx") == true)
    assert(valid_marker?("xoz", nil) == false)
  end

  test "validates markers are not the same" do
    assert(valid_marker?("xx", "xx") == false)
  end

  test "validates width of board" do
    assert(valid_width?("3") == true)
    assert(valid_width?("2") == false)
    assert(valid_width?("df") == false)
  end

  test "validates selection of player types" do
    assert(valid_player_type?("1") == true)
    assert(valid_player_type?("2") == true)
    assert(valid_player_type?("9") == false)
    assert(valid_player_type?("!") == false)
  end
end
