defmodule GameRules do
  import Enum, only: 
    [
      all?: 2,
      any?: 2,
      count: 2,
      filter: 2,
    ]

  import List, only:
    [
       first: 1, 
       flatten: 1,
    ]

  def whose_turn(board, piece_one, piece_two) do
    if number_of_pieces(board, piece_one) == number_of_pieces(board, piece_two) do
      piece_one
    else
      piece_two
    end
  end

  def all_same?(row) do
    piece = first(row)
    all?(row, fn(square) -> square == piece end)
  end

  def winner_on_board?(board) do
    any?(winning_combinations(board), fn(combo) -> all_same?(combo) end)
  end

  def winning_piece(board) do
    filter(winning_combinations(board), fn(combo) -> all_same?(combo) end)
    |> flatten
    |> first
  end

  def winning_combinations(board) do
    Board.rows(board) ++ Board.columns(board) ++ Board.diagonals(board)
  end

  def game_over?(board) do
    winner_on_board?(board) or Board.board_full?(board)   
  end

  defp number_of_pieces(board, piece) do
    count(board, fn(square) -> square == piece end)
  end
end
