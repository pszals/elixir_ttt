defmodule RealIoTest do
  use ExUnit.Case
  import ExUnit.CaptureIO

  test "displays messages" do
    assert capture_io(fn ->
      RealIo.display("hello")
    end) == "hello\n"
  end
end
