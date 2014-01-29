defmodule RealIo do

  def gets(prompt) do
    IO.gets(:stdio, prompt)
  end

  def display(message) do
    IO.puts(message)
  end

  def get_input(prompt) do
    remove_trailing_newline(gets(prompt))
  end

  def get_width(prompt) do
    remove_trailing_newline(gets(prompt))
  end

  def get_piece_one(prompt) do
    remove_trailing_newline(gets(prompt))
  end

  def get_piece_two(prompt) do
    remove_trailing_newline(gets(prompt))
  end

  defp remove_trailing_newline(string) do
    String.strip(string)
  end
end
