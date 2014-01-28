defmodule ValidationsTest do
  use ExUnit.Case
  import Validations

  test "validates a response for 'yes'" do
    assert(valid_response?("y") == true)
    assert(valid_response?("yes") == true)
  end

  test "validates a response for 'no'" do
    assert(valid_response?("n") == true)
    assert(valid_response?("no") == true)
  end

  test "validates a response for 'asdfp09u'" do
    assert(valid_response?("asdfp09u") == false)
  end

  test "validates if selection is available" do
    assert(valid_selection?("3", [1,2,3,4,5,6,7,8,9]) == true)
    assert(valid_selection?("1", ["x",2,3,4,5,6,7,8,9]) == false)
  end
end
