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

  def minimax(board, maximizing, depth, piece_one, piece_two) do
    if GameRules.game_over?(board) do
      score_board(board, GameRules.whose_turn(board, piece_one, piece_two))
    else
      IO.puts GameRules.whose_turn(board, piece_one, piece_two)
      generate_next_level(GameRules.whose_turn(board, piece_one, piece_two), board) |>
      minimax(!maximizing, (depth + 1), piece_one, piece_two)
    end
  end

  defp generate_next_level(piece, board, next_levels, []) do
    Enum.reverse(next_levels)
  end

  defp generate_next_level(piece, board, next_levels, possible_moves) do
    [move|rest] = possible_moves
    new_board = Board.place_piece(board, move, piece)
    generate_next_level(piece, board, [new_board|next_levels], rest)
  end
end
