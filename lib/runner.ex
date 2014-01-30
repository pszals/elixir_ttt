defmodule Runner do
  import HashDict, only: [get: 2]

  def run(io) do
    configurations = Configuration.configure_game(io)
    play_game(io, configurations)
  end

  def play_game(io, configurations) do
    board           = get(configurations, :board)
    piece_one       = get(configurations, :piece_one)
    piece_two       = get(configurations, :piece_two)
    player_one_type = get(configurations, :player_one_type)
    player_two_type = get(configurations, :player_two_type)

    display_board(io, board)

    piece_to_play   = GameRules.whose_turn(board, piece_one, piece_two)
    new_board = Players.human_move(io, board, piece_to_play)
    configurations = HashDict.put(configurations, :board, new_board)
    if GameRules.game_over?(new_board) do
      display_board(io, board)
      GameRules.winning_piece(new_board) |>
      Messages.announce_result |>
      io.display
    else
      play_game(io, configurations)
    end
  end

  defp display_board(io, board) do
    BoardPresenter.format_board(board) |>
    io.display
  end
end
