defmodule Configuration do
  import Messages

  def configure_game(io) do
    configurations = HashDict.new
    width = configure_width(io)
    HashDict.put(configurations, :width, width) 
  end

  defp configure_width(io) do
    width = io.get_width("")
    io.display(query_for_board_width)
    if Validations.valid_width?(width) do
      width 
    else
      io.display(error_width)
      configure_width(io)
    end
  end
end
