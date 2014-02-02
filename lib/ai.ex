defmodule Ai do
  import Enum, only: 
    [
      min: 1,
      map: 2,
      max: 1,
      max_by: 2,
      min_by: 2,
      reverse: 1,
      zip: 2,
    ]

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

  defp generate_next_level(_, _, next_levels, []) do
    reverse(next_levels)
  end

  defp generate_next_level(piece, board, next_levels, possible_moves) do
    [move|rest] = possible_moves
    new_board = Board.place_piece(board, move, piece)
    generate_next_level(piece, board, [new_board|next_levels], rest)
  end

  def negamax(board, maximizing, depth, piece_one, piece_two, ai_piece) do
    cond do
      GameRules.game_over?(board) ->
        score_board(board, ai_piece) / depth
      maximizing ->
        max(generate_next_level(GameRules.whose_turn(board, piece_one, piece_two), board) |>
        map(fn(board) -> negamax(board, !maximizing, (depth + 1), piece_two, piece_one, ai_piece) end))
      !maximizing ->
        min(generate_next_level(GameRules.whose_turn(board, piece_one, piece_two), board) |>
        map(fn(board) -> negamax(board, !maximizing, (depth + 1), piece_two, piece_one, ai_piece) end))
    end
  end

  def squares_with_scores(board, ai_piece, other_piece) do
    open_squares = Board.empty_squares(board)
    next_level = generate_next_level(ai_piece, board)
    scores = map(next_level, fn(level) -> negamax(level, true, 1, other_piece, ai_piece, ai_piece) end) 
    zip(open_squares, scores)
  end

  def best_square(board, ai_piece, other_piece) do
    squares_with_scores(board, ai_piece, other_piece) |>
    max_value
  end

  def max_value(list_of_tuples) do
    {square, _} = max_by(list_of_tuples, fn{_, score} -> score end)
    square
  end

  def min_value(list_of_tuples) do
    {square, _} = min_by(list_of_tuples, fn{_, score} -> score end)
    square
  end
end
