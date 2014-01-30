defmodule ConfigurationTest do
  use ExUnit.Case
  import Configuration

  test "gets configuration variables" do
    configurations = configure_game(MockIo)
    assert(HashDict.get(configurations, :board) == [1,2,3,4,5,6,7,8,9])
    assert(HashDict.get(configurations, :piece_one) == "Q")
    assert(HashDict.get(configurations, :piece_two) == "R")
    assert(HashDict.get(configurations, :player_one_type) == Constants.human_player)
    assert(HashDict.get(configurations, :player_two_type) == Constants.human_player)
  end
end
