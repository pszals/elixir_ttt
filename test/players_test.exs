defmodule PlayersTest do
  use ExUnit.Case
  
  test "human player makes a move" do
    assert(Players.make_move(MockIo, [1,2,3,4,5,6,7,8,9], "x", "o", Constants.human_player) == [1,2,"x",4,5,6,7,8,9])
  end
end
