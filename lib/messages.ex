defmodule Messages do
  def welcome do
    "Welcome to Tic Tac Toe running on Elixir!"
  end

  def query_for_board_width do
    "Enter 3 (quick) for a 3x3 game or 4 (not recommended against a computer opponent, unless you are running on a VERY powerful machine) for a 4x4 game\n>> "
  end

  def query_for_markers do
    "Enter any letter (or two letters!) of the English alphabet to serve as a marker\n>> "
  end

  def query_for_first_player do
    "Which player should go first? (1 for player one, 2 for player 2)\n>> "
  end

  def query_for_player_type do
    "Choose a player type. Enter 1 for human or 2 for computer\n>> "
  end

  def announce_turn(piece) do
    "It's #{piece}'s turn!"
  end

  def query_for_square do
    "To place your piece, enter the number of an empty square on the board\n>> "
  end

  def error_not_valid do
    "Whoops, that doesn't quite work"
  end

  def error_not_empty do
    "That square has already been taken. Try again"
  end

  def error_not_number do
    "That is not a number. Enter the number of an empty square on the board"
  end
  
  def error_width do
    "That is not a valid board width. Try just entering 3."
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
    "Would you like to play again?\n>> "
  end

  def announce_result(result) do
    if result == nil do
      announce_tie <> "\n" <>
      game_over
    else
      announce_winner(result) <> "\n" <>
      game_over
    end
  end
end
