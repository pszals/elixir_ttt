defmodule MockIO do
  def gets(io_device, prompt) do
    "3\n"
  end

  def puts(message) do
    message
  end
end
