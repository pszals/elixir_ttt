defmodule Messages do
  def display_board(board) do
    rows = Board.rows(board)
    Enum.map(rows, fn(row) -> format_row(row) end)
  end

  defp format_row(row) do
    format_row(row, 1)
  end

  defp format_row([h|t], 1) do
    square_one = " " <> to_string(first) <> " "
    format_internal_square(square_one, t, 2)
  end

  defp format_internal_square(first, [h|t], acc) do
    format_row(first <> "| " <> h <> " |",  acc + 1)
    first
  end
end
