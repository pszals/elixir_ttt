defmodule Messages do
  def format_board(board) do
    Enum.map(board, fn(square) -> add_padding(square) end) |>
    Board.rows |>
    Enum.map(fn(row) -> Enum.join(row, BoardParts.pipe) end) |>
    Enum.join(row_divider(board))
  end

  defp add_padding(square) do
    if one_character?(square) do
      BoardParts.double_padding <> to_string(square) <> BoardParts.double_padding
    else
      BoardParts.double_padding <> to_string(square) <> BoardParts.single_padding
    end
  end

  defp row_divider(board) do
    number_of_crosshairs = Float.floor(:math.sqrt(length(board))) -1
    List.duplicate(BoardParts.crosshair, number_of_crosshairs) |>
    join_crosshairs
  end

  defp join_crosshairs(list_of_crosshairs) do
    BoardParts.newline_row_divider <> Enum.join(list_of_crosshairs, BoardParts.row_divider) <> BoardParts.row_divider_newline
  end

  defp one_character?(square) do
    String.length(to_string(square)) == 1
  end
end
