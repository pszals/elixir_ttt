defmodule RealIo do

  def gets(prompt) do
    IO.gets(:stdio, prompt)
  end

  def display(message) do
    IO.puts(message)
  end

  def get_input(prompt) do
    gets(prompt)
    |> remove_trailing_newline
  end

  def get_width(prompt) do
    gets(prompt) 
    |> remove_trailing_newline
  end

  def get_piece_one(prompt) do
    gets(prompt) 
    |> remove_trailing_newline
  end

  def get_piece_two(prompt) do
    gets(prompt) 
    |> remove_trailing_newline
  end

  def get_player_type(prompt) do
    gets(prompt) 
    |> remove_trailing_newline
  end

  def get_move(prompt) do
    gets(prompt) 
    |> remove_trailing_newline
  end

  defp remove_trailing_newline(string) do
    String.strip(string)
  end
end
