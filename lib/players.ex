defmodule Players do
  def human_move(ui, board, piece) do
    move = Messages.get_input(ui, "")
    if Validations.valid_move?(move, board) do
      Board.place_piece(board, binary_to_integer(move), piece) 
    end
  end
end
