defmodule Ai do
  def score_board(board, piece) do
    cond do
      GameRules.winning_piece(board) == nil ->
        0
      GameRules.winning_piece(board) == piece ->
        1
      true ->
        -1
    end
  end

  def generate_next_level(piece, board) do
    possible_moves = Board.empty_squares(board)
    generate_next_level(piece, board, [], possible_moves)
  end

  def generate_next_level(piece, board, next_levels, []) do
    next_levels
  end

  def generate_next_level(piece, board, next_levels, possible_moves) do
    [move|rest] = possible_moves
    new_board = Board.place_piece(board, move, piece)
    generate_next_level(piece, board, [new_board|next_levels], rest)
  end
end
