defmodule ConfigurationTest do
  use ExUnit.Case
  import Configuration

  test "gets configuration variables" do
    configurations = configure_game(MockIo)
    assert(HashDict.get(configurations, :width) == "3")
    assert(HashDict.get(configurations, :piece_one) == "Q")
    assert(HashDict.get(configurations, :piece_two) == "R")
    assert(HashDict.get(configurations, :player_one_type) == "1")
    assert(HashDict.get(configurations, :player_two_type) == "1")
  end
end
