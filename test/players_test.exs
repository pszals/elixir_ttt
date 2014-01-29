defmodule PlayersTest do
  use ExUnit.Case
  import ExUnit.CaptureIO
  
  test "human player makes a move" do
    assert(Players.human_move(MockIo, [1,2,3,4,5,6,7,8,9], "x") == [1,2,"x",4,5,6,7,8,9])

    assert capture_io(fn ->
      Messages.display(RealIo, "hello")
    end) == "hello\n"
  end
end
