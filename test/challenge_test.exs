defmodule ChallengeTest do
  use ExUnit.Case

  test "adding two numbers" do
    assert(Challenge.add_two(1, 2) == 3)
  end
end
