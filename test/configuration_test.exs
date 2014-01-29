defmodule ConfigurationTest do
  use ExUnit.Case
  import Configuration

  test "gets configuration variables" do
    configurations = configure_game(MockIO)
    assert(HashDict.get(configurations, :width) == "3")
  end

# test "what does the fox say" do
#   assert("3" == String.strip(IO.gets(:stdio)))
# end
end
