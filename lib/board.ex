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

  def remove_piece(board, index) do
    List.replace_at(board, index, index + 1)
  end

  def empty_squares(board) do
    Enum.filter(board, fn(square) -> is_number(square) end)
  end

  def board_full?(board) do
    empty_squares(board) == 0
  end

  def rows(board) do
    row_size = Float.floor(:math.sqrt(length(board)))
    Enum.chunk(board, row_size)
  end

  def columns(board) do
    rows = Board.rows(board)
    rows_with_index = Enum.with_index(rows)

    [Enum.map(rows, fn(row) -> Enum.at(row, 0) end)] ++
    [Enum.map(rows, fn(row) -> Enum.at(row, 1) end)] ++
    [Enum.map(rows, fn(row) -> Enum.at(row, 2) end)]
  end

  def diagonals(board) do
    rows = Board.rows(board)
    [diagonal_down(rows)] ++ [diagonal_up(rows)]
  end

  defp diagonal_down(rows) do
    Enum.with_index(rows) |> 
    Enum.map(fn{row, index} -> Enum.at(row, index) end)
  end

  defp diagonal_up(rows) do
    Enum.map(rows, fn(row) -> Enum.reverse(row) end) |>
    Enum.with_index |>
    Enum.map(fn{row, index} -> Enum.at(row, index) end)
  end
end
