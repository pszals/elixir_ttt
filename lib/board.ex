defmodule Board do
  import Enum, only: 
    [
      at: 2,
      chunk: 2, 
      count: 1,
      filter: 2, 
      map: 2,
      reverse: 1,
      to_list: 1, 
      with_index: 1,
    ]
  import List, only: 
    [
      replace_at: 3,
      unzip: 1,
    ]

  def create_board(width) do
    to_list(1 .. (width * width))
  end

  def square_empty?(board, square) do
    is_number(at(board, (square - 1)))
  end

  def place_piece(board, square, piece) do
    replace_at(board, (square - 1), piece)
  end

  def remove_piece(board, index) do
    replace_at(board, index, index + 1)
  end

  def empty_squares(board) do
    filter(board, fn(square) -> is_number(square) end)
  end

  def board_full?(board) do
    empty_squares(board)
    |> count == 0
  end

  def board_empty?(board) do
    length(empty_squares(board)) == length(board)
  end

  def rows(board) do
    row_size = Float.floor(:math.sqrt(length(board)))
    chunk(board, row_size)
  end

  def columns(board) do
    rows = rows(board)
    unzip(rows)
  end

  def diagonals(board) do
    rows = rows(board)
    [diagonal_down(rows)] ++ [diagonal_up(rows)]
  end

  defp diagonal_down(rows) do
    with_index(rows) 
    |> map(fn{row, index} -> at(row, index) end)
  end

  defp diagonal_up(rows) do
    map(rows, fn(row) -> reverse(row) end)
    |> with_index
    |> map(fn{row, index} -> at(row, index) end)
  end
end
