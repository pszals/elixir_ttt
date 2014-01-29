defmodule PlayersTest do
  use ExUnit.Case
  
  test "human player makes a move" do
    assert(Players.human_move(MockIO, [1,2,3,4,5,6,7,8,9], "x") == ["x",2,3,4,5,6,7,8,9])
  end
end
