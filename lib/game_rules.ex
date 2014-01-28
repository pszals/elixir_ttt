defmodule GameRules do
  def whose_turn(board, piece_one, piece_two) do
    if number_of_pieces(board, piece_one) == number_of_pieces(board, piece_two) do
      piece_one
    else
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
    Enum.filter(winning_combinations(board), fn(combo) -> all_same?(combo) end) |> 
    List.flatten |> 
    List.first
  end

  def winning_combinations(board) do
    Board.rows(board) ++ Board.columns(board) ++ Board.diagonals(board)
  end

  defp number_of_pieces(board, piece) do
    Enum.count(board, fn(square) -> square == piece end)
  end
end
