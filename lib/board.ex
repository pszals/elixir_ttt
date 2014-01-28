defmodule Board do
  def create_board(width) do
    Enum.to_list(1 .. (width * width))
  end

  def square_empty?(board, square) do
    is_number(Enum.at(board, (square - 1)))
  end

  def place_piece(board, square, piece) do
    List.replace_at(board, (square - 1), piece)
  end

  def empty_squares(board) do
    Enum.filter(board, fn(square) -> is_number(square) end)
  end

  def rows(board) do
    row_size = Float.floor(:math.sqrt(length(board)))
    Enum.chunk(board, row_size)
  end

  def board_full?(board) do
    empty_squares(board) == 0
  end
end
