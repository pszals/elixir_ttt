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
end
