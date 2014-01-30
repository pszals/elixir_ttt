defmodule RunnerTest do
  use ExUnit.Case
  import Runner

  test "playing a game" do
    assert(play_game(MockIo, configurations) == [1,2,3,4,5,6,7,8,9])
  end
end
