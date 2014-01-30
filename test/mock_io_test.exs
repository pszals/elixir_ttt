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
  
  test "gets piece one" do
    assert(get_piece_one("") == "Q")
  end

  test "gets player type" do
    assert(get_player_type("") == "1")
  end
end
