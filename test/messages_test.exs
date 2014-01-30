defmodule MessagesTest do
  use ExUnit.Case
  import Messages

  test "welcomes player to game" do
    assert(welcome == "Welcome to Tic Tac Toe running on Elixir!")
  end

  test "asks for board width" do
    assert(query_for_board_width == "Enter 3 (quick) for a 3x3 game or 4 (slower) for a 4x4 game")
  end

  test "asks for marker types" do
    assert(query_for_markers == "Enter any letter (or two letters!) of the English alphabet to serve as a marker") 
  end

  test "asks for player type" do
    assert(query_for_player_type == "Choose a player type. Enter 1 for human or 2 for computer")
  end

  test "asks which marker goes first" do
    assert(query_for_first_player == "Which player should go first? (1 for player one, 2 for player 2)")
  end

  test "announces whose turn it is" do
    assert(announce_turn("K") == "It's K's turn!")
  end

  test "asks for input/square to mark" do
    assert(query_for_square == "To place your piece, enter the number of an empty square on the board")
  end

  test "gives error message if bad player type selection" do
    assert(error_not_valid_player_type == "Whoops, I didn't understand that")
  end

  test "gives error message if square is not empty" do
    assert(error_not_empty == "That square has already been taken. Try again")
  end

  test "gives error message if input is not a number" do
    assert(error_not_number == "That is not a number. Enter the number of an empty square on the board")
  end

  test "gives error message if width is invalid" do
    assert(error_width == "That is not a valid board width. Try just entering 3.")
  end

  test "announces end of game" do
    assert(game_over == "Game Over! Or is it?")
  end

  test "announces winner of game" do
    assert(announce_winner("Q") == "Player Q wins!")
  end

  test "announces tie game" do
    assert(announce_tie == "Tie Game!")
  end

  test "asks to replay or exit game" do
    assert(query_for_replay == "Would you like to play again?")
  end
end
