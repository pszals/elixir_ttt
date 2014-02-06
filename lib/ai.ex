defmodule Ai do
  import Enum, only: 
    [
      map: 2,
      max: 1,
      max_by: 2,
      min: 1,
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
    Board.empty_squares(board)
    |> map(fn(move) -> Board.place_piece(board, move, piece) end)
  end

  def negamax(board, depth, piece_one, piece_two) do
      if GameRules.game_over?(board) do
        score_board(board, piece_two) / depth
      else
        generate_next_level(piece_one, board) 
        |> map(fn(level) -> -1 * negamax(level, (depth + 1), piece_two, piece_one) end) 
        |> min
    end
  end

  def squares_with_scores(board, ai_piece, other_piece) do
    if Board.board_empty?(board) do
      move_into_corner
    else
      next_level = generate_next_level(ai_piece, board)
      scores = map(next_level, fn(level) -> negamax(level, 1, other_piece, ai_piece) end) 
      open_squares = Board.empty_squares(board)
      zip(open_squares, scores)
    end
  end

  def best_square(board, ai_piece, other_piece) do
    squares_with_scores(board, ai_piece, other_piece)
    |> max_value
  end

  def max_value(list_of_tuples) do
    {square, _} = max_by(list_of_tuples, fn{_, score} -> score end)
    square
  end

  def min_value(list_of_tuples) do
    {square, _} = min_by(list_of_tuples, fn{_, score} -> score end)
    square
  end

  defp move_into_corner do
    [{3, 1}]
  end
end
