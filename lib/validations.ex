defmodule Validations do
  import Board, only: [square_empty?: 2]
  import Constants, only: [yes_or_no: 0]
  import Integer, only: [parse: 1]

  def yes_or_no?(response) do
    yes_or_no |>
    Enum.any?(fn(input) -> response == input end)
  end

  def valid_move?(square, board) do
    square_is_a_number?(square) and 
    square_on_board?(square, board) and 
    square_empty?(board, binary_to_integer(square))
  end

  def valid_marker?(marker_one, marker_two) do
    !same_markers?(marker_one, marker_two) and
    contains_one_or_two_letters?(marker_one)
  end

  defp contains_one_or_two_letters?(marker) do
      Regex.match?(%r/^[A-Za-z]{1,2}$/, marker)
  end

  defp square_is_a_number?(square) do
    parse(square) != :error
  end

  defp square_on_board?(square, board) do
    length(board) >= parse(square) > 0
  end

  defp same_markers?(m1, m2) do
    m1 == m2
  end
end
