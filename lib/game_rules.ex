defmodule GameRules do
  def whose_turn(board, piece_one, piece_two) do
    cond do
      number_of_pieces(board, piece_one) == number_of_pieces(board, piece_two) ->
        piece_one
      true ->
        piece_two
    end
  end

  def all_same?(row) do
    piece = List.first(row)
    Enum.all?(row, fn(square) -> square == piece end)
  end

  def winner_on_board?(board) do
    Enum.any?(winning_combinations(board), fn(combo) -> all_same?(combo) end)
  end

  def winning_piece(board) do
    List.first(List.flatten(Enum.filter(winning_combinations(board), fn(combo) -> all_same?(combo) end)))
  end

  def winning_combinations(board) do
    Board.rows(board) ++ columns(board) ++ diagonals(board)
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
    rows_with_index = Enum.with_index(rows)
    Enum.map(rows_with_index, fn{row, index} -> Enum.at(row, index) end)
  end

  defp diagonal_up(rows) do
    reversed_rows = Enum.map(rows, fn(row) -> Enum.reverse(row) end)
    reversed_rows_with_index = Enum.with_index(reversed_rows)
    Enum.map(reversed_rows_with_index, fn{row, index} -> Enum.at(row, index) end)
  end

  defp number_of_pieces(board, piece) do
    Enum.count(board, fn(square) -> square == piece end)
  end
end
