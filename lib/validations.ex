defmodule Validations do
  import Board, only: [square_empty?: 2]

  def valid_response?(response) do
    response == "y" or response == "n"
  end

  def valid_selection?(square, board) do
    if square_is_a_number?(square) and square_on_board?(square, board) do
      square_empty?(board, binary_to_integer(square))
    end
  end

  defp square_is_a_number?(square) do
    Integer.parse(square) != :error
  end

  defp square_on_board?(square, board) do
    length(board) >= Integer.parse(square) > 0
  end
end
