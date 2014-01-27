defmodule GameRulesTest do
  use ExUnit.Case

  test "determines if there is a winner" do
    assert(GameRules.all_same?(["x", "x", "x"]) == true)
    assert(GameRules.all_same?(["o", "o", "o"]) == true)
    assert(GameRules.all_same?(["R", "R", "R"]) == true)
    assert(GameRules.all_same?(["x", "o", "x"]) == false)
    assert(GameRules.all_same?(["x", 2, "x"]) == false)
  end
end
