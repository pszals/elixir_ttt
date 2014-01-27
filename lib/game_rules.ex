defmodule GameRules do
  def all_same?(row) do
    piece = List.first(row)
    Enum.all?(row, fn(x) -> x == piece end)
  end
end
