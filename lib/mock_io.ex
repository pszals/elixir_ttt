defmodule MockIo do
  def display(message) do
    message
  end

  def get_width(_) do
    "3"
  end

  def get_move(_) do
    "3"
  end

  def get_piece_one(_) do
    "Q"
  end
  
  def get_piece_two(_) do
    "R"
  end

  def get_player_type(_) do
    "1"
  end
end
