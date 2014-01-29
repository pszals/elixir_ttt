defmodule ConfigurationTest do
  use ExUnit.Case
  import Configuration

  test "gets configuration variables" do
    configurations = configure_game(MockIo)
    assert(HashDict.get(configurations, :width) == "3")
  end
end
