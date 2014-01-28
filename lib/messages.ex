defmodule Messages do
  def display_board(board) do
    rows = Board.rows(board)
    Enum.map(rows, fn(row) -> format_row(row) end)
  end

  defp format_row([h|t]) do
    square_one = " " <> to_string(h) <> " "
    format_internal_square(square_one, t, 1)
  end

  defp format_internal_square(first, [h|t], acc) do
    format_row(first <> "| " <> to_string(h) <> " |",  acc + 1)
    first
  end
end
