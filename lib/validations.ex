defmodule Validations do
  import Board, only: [square_empty?: 2]
  import Constants, only: [yes_or_no: 0]
  import Integer, only: [parse: 1]

  def yes_or_no?(response) do
    yes_or_no |>
    Enum.any?(fn(input) -> response == input end)
  end

  def valid_move?(square, board) do
    is_a_number?(square) and 
    square_on_board?(square, board) and 
    square_empty?(board, binary_to_integer(square))
  end

  def valid_marker?(marker_one, marker_two) do
    !same_markers?(marker_one, marker_two) and
    contains_one_or_two_letters?(marker_one)
  end

  def valid_width?(width) do
    in_board_range?(binary_to_integer(width))
  end

  def valid_player_type?(selection) do
    is_a_number?(selection) and
    valid_selection?(selection)
  end

  defp contains_one_or_two_letters?(marker) do
      Regex.match?(%r/^[A-Za-z]{1,2}$/, marker)
  end

  defp is_a_number?(square) do
    parse(square) != :error
  end

  defp square_on_board?(square, board) do
    length(board) >= parse(square) > 0
  end

  defp same_markers?(m1, m2) do
    m1 == m2
  end

  defp in_board_range?(width) do
    5 > width > 2
  end

  defp valid_selection?(selection) do
    selection == Constants.human_player or selection == Constants.computer_player
  end
end
