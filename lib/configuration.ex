defmodule Configuration do
  import Messages
  import Validations, only:
    [
      valid_width?: 1,
      valid_marker?: 2,
      valid_player_type?: 1,
    ]

  def configure_game(io) do
    configurations = HashDict.new
    board = configure_board(io)
    {piece_one, piece_two} = configure_pieces(io)
    {player_one_type, player_two_type} = configure_player_types(io)

    configurations = HashDict.put(configurations, :board, board) 
    configurations = HashDict.put(configurations, :piece_one, piece_one) 
    configurations = HashDict.put(configurations, :piece_two, piece_two) 
    configurations = HashDict.put(configurations, :player_one_type, player_one_type) 
    configurations = HashDict.put(configurations, :player_two_type, player_two_type) 
    configurations
  end

  defp configure_board(io) do
    width = io.get_width(query_for_board_width)
    if valid_width?(width) do
      Board.create_board(binary_to_integer(width)) 
    else
      io.display(error_not_valid)
      configure_board(io)
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

  defp configure_player_types(io) do
    player_type = io.get_player_type(query_for_player_type)
    if valid_player_type?(player_type) do
      configure_player_types(io, player_type)
    else
      io.display(error_not_valid)
      configure_player_types(io)
    end
  end

  defp configure_player_types(io, player_one_type) do
    player_two_type = io.get_player_type(query_for_player_type)
    if valid_player_type?(player_two_type) do
      {player_one_type, player_two_type}
    else
      io.display(error_not_valid)
      configure_player_types(io, player_one_type)
    end
  end
end
