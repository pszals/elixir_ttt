defmodule MockIoTest do
  use ExUnit.Case
  import MockIo 

  test "displays a message" do
    assert(display("Hello") == "Hello")
  end

  test "gets width" do
    assert(get_width("") == "3")
  end

  test "gets move" do
    assert(get_move("") == "3")
  end
end
