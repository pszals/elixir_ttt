defmodule Messages do
  def welcome do
    "Welcome to Tic Tac Toe running on Elixir!"
  end

  def query_for_markers do
    "Enter any letter of the English alphabet to serve as your marker"
  end

  def query_for_first_player do
    "Which player should go first? (1 for player one, 2 for player 2)"
  end

  def announce_turn(piece) do
    "It's #{piece}'s turn!"
  end

  def query_for_square do
    "To place your piece, enter the number of an empty square on the board"
  end

  def error_not_empty do
    "That square has already been taken. Try again"
  end

  def error_not_number do
    "That is not a number. enter the number of an empty square on the board"
  end

  def game_over do
    "Game Over! Or is it?"
  end

  def announce_winner(piece) do
    "Player #{piece} wins!"
  end

  def announce_tie do
    "Tie Game!"
  end

  def query_for_replay do
    "Would you like to play again?"
  end
end
