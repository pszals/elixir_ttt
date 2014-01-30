defmodule Players do
  import Messages, only:
    [
      announce_turn: 1,
      query_for_square: 0,
      error_not_valid: 0,
    ]

  def human_move(io, board, piece) do
    announce_turn(piece) |> io.display
    move = query_for_square |> io.get_move

    if Validations.valid_move?(move, board) do
      Board.place_piece(board, binary_to_integer(move), piece) 
    else
      error_not_valid |> io.display
      human_move(io, board, piece)
    end
  end
end
