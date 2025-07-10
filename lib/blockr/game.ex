defmodule Blockr.Game do
  alias Blockr.Game.Tetromino

  def left(board) do
    updated_tetro = Tetromino.left(board.tetro)

    attempt_move(board, updated_tetro)
  end

  def right(board) do
    updated_tetro = Tetromino.right(board.tetro)

    attempt_move(board, updated_tetro)
  end

  def rotate(board) do
    updated_tetro = Tetromino.rotate_right_90(board.tetro)

    attempt_move(board, updated_tetro)
  end

  defp attempt_move(board, tetro) do
    set =
      tetro
      |> Tetromino.to_group()
      |> MapSet.new()

    intersection = MapSet.intersection(set, board.points)

    should_move? = MapSet.size(intersection) == 0

    if should_move? do
      %{board | tetro: tetro}
    else
      board
    end
  end
end
