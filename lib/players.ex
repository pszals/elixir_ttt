defmodule Players do
  import Messages, only:
    [
      announce_turn: 1,
      error_not_valid: 0,
      query_for_square: 0,
    ]

  def make_move(io, board, piece, _, "1") do
    announce_turn(piece) 
    |> io.display
    move = query_for_square 
    |> io.get_move

    if Validations.valid_move?(move, board) do
      Board.place_piece(board, binary_to_integer(move), piece) 
    else
      error_not_valid 
      |> io.display
      make_move(io, board, piece, nil, "1")
    end
  end
  
  def make_move(io, board, piece, other_piece, "2") do
    announce_turn(piece) 
    |> io.display
    move = Ai.best_square(board, piece, other_piece)
    Board.place_piece(board, move, piece) 
  end
end
