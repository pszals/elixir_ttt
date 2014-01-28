defmodule Validations do
  import Board, only: [square_empty?: 2]
  import Constants, only: [acceptable_responses: 0]

  def valid_response?(response) do
    acceptable_responses |>
    Enum.any?(fn(input) -> response == input end)
  end

  def valid_selection?(square, board) do
    if square_is_a_number?(square) and square_on_board?(square, board) do
      square_empty?(board, binary_to_integer(square))
    end
  end

  def valid_marker?(marker_one, marker_two) do
    if same_markers?(marker_one, marker_two) do
      false
    else
      contains_one_or_two_letters?(marker_one)
    end
  end

  defp contains_one_or_two_letters?(marker) do
      Regex.match?(%r/^[A-Za-z]{1,2}$/, marker)
  end

  defp square_is_a_number?(square) do
    Integer.parse(square) != :error
  end

  defp square_on_board?(square, board) do
    length(board) >= Integer.parse(square) > 0
  end

  defp same_markers?(m1, m2) do
    m1 == m2
  end
end
