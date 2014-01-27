defmodule GameRules do
  def all_same?(row) do
    piece = List.first(row)
    Enum.all?(row, fn(x) -> x == piece end)
  end

  def whose_turn(board, piece_one, piece_two) do
    number_of_player_one_pieces = Enum.count(board, fn(x) -> x == piece_one end) 
    number_of_player_two_pieces = Enum.count(board, fn(x) -> x == piece_two end) 
    cond do
      number_of_player_one_pieces == number_of_player_two_pieces ->
        piece_one
      true ->
        piece_two
    end
  end

  def winner_on_board?(board) do
    true
  end

  def winning_combinations(board) do
    rows(board) ++ columns(board) ++ diagonals(board)
  end

  def rows(board) do
    row_size = Float.floor(:math.sqrt(length(board)))
    Enum.chunk(board, row_size)
  end

  def columns(board) do
    rows = rows(board)
    rows_with_index = Enum.with_index(rows)

    [Enum.map(rows, fn(row) -> Enum.at(row, 0) end)] ++
    [Enum.map(rows, fn(row) -> Enum.at(row, 1) end)] ++
    [Enum.map(rows, fn(row) -> Enum.at(row, 2) end)]
  end

  def diagonals(board) do
    rows = rows(board)
    [diagonal_down(rows)] ++ [diagonal_up(rows)]
  end

  defp diagonal_down(rows) do
    rows_with_index = Enum.with_index(rows)
    Enum.map(rows_with_index, fn{row, index} -> Enum.at(row, index) end)
  end

  defp diagonal_up(rows) do
    reversed_rows = Enum.map(rows, fn(row) -> Enum.reverse(row) end)
    reversed_rows_with_index = Enum.with_index(reversed_rows)
    diagonal_up = Enum.map(reversed_rows_with_index, fn{row, index} -> Enum.at(row, index) end)
  end
end
