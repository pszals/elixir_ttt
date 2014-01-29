defmodule Players do
  def human_move(io, board, piece) do
    move = io.get_move("")
    if Validations.valid_move?(move, board) do
      Board.place_piece(board, binary_to_integer(move), piece) 
    end
  end
end
