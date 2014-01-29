defmodule Configuration do
  import Messages

  def configure_game(io) do
    configurations = HashDict.new
    width = configure_width(io)
    piece_one = configure_piece_one(io)
    piece_two = configure_piece_two(io, piece_one)

    configurations = HashDict.put(configurations, :width, width) 
    configurations = HashDict.put(configurations, :piece_one, piece_one) 
    configurations = HashDict.put(configurations, :piece_two, piece_two) 
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

  defp configure_piece_one(io) do
    piece_one = io.get_piece_one(query_for_markers)
    if Validations.valid_marker?(piece_one, nil) do
      piece_one
    else
      io.display(error_width)
      configure_piece_one(io)
    end
  end
  
  defp configure_piece_two(io, piece_one) do
    piece_two = io.get_piece_two(query_for_markers)
    if Validations.valid_marker?(piece_one, piece_two) do
      piece_two
    else
      io.display(error_width)
      configure_piece_two(io, piece_one)
    end
  end
end
