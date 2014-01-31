defmodule Players do
  import Messages, only:
    [
      announce_turn: 1,
      query_for_square: 0,
      error_not_valid: 0,
    ]

  def make_move(io, board, piece, "1") do
    announce_turn(piece) |> io.display
    move = query_for_square |> io.get_move

    if Validations.valid_move?(move, board) do
      Board.place_piece(board, binary_to_integer(move), piece) 
    else
      error_not_valid |> io.display
      make_move(io, board, piece, "1")
    end
  end
  
  def make_move(io, board, piece, "2") do
  end
end
