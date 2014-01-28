defmodule ValidationsTest do
  use ExUnit.Case

  test "validates a response for 'yes'" do
    assert(Validations.valid_response?("y") == true)
  end

  test "validates a response for 'no'" do
    assert(Validations.valid_response?("n") == true)
  end

  test "validates a response for 'asdfp09u'" do
    assert(Validations.valid_response?("asdfp09u") == false)
  end

  test "validates if selection is available" do
    assert(Validations.valid_selection?("3", [1,2,3,4,5,6,7,8,9]) == true)
    assert(Validations.valid_selection?("1", ["x",2,3,4,5,6,7,8,9]) == false)
  end
end
