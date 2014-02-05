defmodule RunnerTest do
  use ExUnit.Case
  import Runner

  import HashDict, only: [put: 3]

  test "playing a game" do
    configurations = HashDict.new
    configurations = put(configurations, :board, ["x", "x", 3,
                                                  "o", "o", 6,
                                                   7,   8,  9])
    configurations = put(configurations, :piece_one, "x")
    configurations = put(configurations, :piece_two, "o")
    configurations = put(configurations, :player_one_type, Constants.human_player)
    configurations = put(configurations, :player_two_type, Constants.human_player)

    assert(play_game(MockIo, configurations) == "Player x wins!\nGame Over! Or is it?")
  end
end
