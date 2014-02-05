defmodule BoardPresenter do
  import BoardParts
  import Enum, only: 
    [
      join: 2,
      map: 2,
    ]

  def format_board(board) do
    map(board, fn(square) -> add_padding(square) end)
    |> Board.rows
    |> map(fn(row) -> join(row, pipe) end)
    |> join(row_divider(board))
  end

  defp add_padding(square) do
    if one_character?(square) do
      double_padding <> to_string(square) <> double_padding
    else
      double_padding <> to_string(square) <> single_padding
    end
  end

  defp row_divider(board) do
    number_of_crosshairs = (length(board) 
    |> :math.sqrt
    |> Float.floor) - 1
    List.duplicate(crosshair, number_of_crosshairs)
    |> join_crosshairs
  end

  defp join_crosshairs(list_of_crosshairs) do
    newline_row_divider <> join(list_of_crosshairs, row_divider) <> row_divider_newline
  end

  defp one_character?(square) do
    String.length(to_string(square)) == 1
  end
end
