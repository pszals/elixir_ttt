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

  def negamax(board, maximizing, depth, piece_one, piece_two) do
    cond do
      GameRules.game_over?(board) ->
        score_board(board, "o") / depth
      maximizing ->
        Enum.min(generate_next_level(GameRules.whose_turn(board, piece_one, piece_two), board) |>
        Enum.map(fn(board) -> negamax(board, !maximizing, (depth + 1), piece_two, piece_one) end))
      !maximizing ->
        Enum.max(generate_next_level(GameRules.whose_turn(board, piece_one, piece_two), board) |>
        Enum.map(fn(board) -> negamax(board, !maximizing, (depth + 1), piece_two, piece_one) end))
    end
  end

  def squares_with_scores(board, piece_to_play, other_piece) do
    open_squares = Board.empty_squares(board)
    next_level = generate_next_level(piece_to_play, board)
    scores = Enum.map(next_level, fn(level) -> negamax(level, false, 1, other_piece, piece_to_play) end) 
    Enum.zip(open_squares, scores)
  end

  def best_square(board, ai_piece, other_piece) do
    squares_with_scores(board, ai_piece, other_piece) |>
    max_value
  end

  def max_value(list_of_tuples) do
    {square, _} = Enum.max_by(list_of_tuples, fn{_,v} -> v end)
    square
  end

  defp generate_next_level(_, _, next_levels, []) do
    Enum.reverse(next_levels)
  end

  defp generate_next_level(piece, board, next_levels, possible_moves) do
    [move|rest] = possible_moves
    new_board = Board.place_piece(board, move, piece)
    generate_next_level(piece, board, [new_board|next_levels], rest)
  end
end
