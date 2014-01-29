defmodule Configuration do
  import Messages
  import Validations

  def configure_game(io) do
    configurations = HashDict.new
    width = configure_width(io)
    {piece_one, piece_two} = configure_pieces(io)

    configurations = HashDict.put(configurations, :width, width) 
    configurations = HashDict.put(configurations, :piece_one, piece_one) 
    configurations = HashDict.put(configurations, :piece_two, piece_two) 
  end

  defp configure_width(io) do
    width = io.get_width("")
    io.display(query_for_board_width)
    if valid_width?(width) do
      width 
    else
      io.display(error_width)
      configure_width(io)
    end
  end

  defp configure_pieces(io) do
    piece_one = io.get_piece_one(query_for_markers)
    if valid_marker?(piece_one, nil) do
      configure_pieces(io, piece_one)
    else
      io.display(error_width)
      configure_pieces(io)
    end
  end
  
  defp configure_pieces(io, piece_one) do
    piece_two = io.get_piece_two(query_for_markers)
    if valid_marker?(piece_one, piece_two) do
      {piece_one, piece_two}
    else
      io.display(error_width)
      configure_pieces(io, piece_one)
    end
  end
end
