defmodule Blockr.Game do
  alias Blockr.Game.Board
  alias Blockr.Game.Tetromino

  def left(board) do
    updated_tetro = Tetromino.left(board.tetro)

    replace_unless_collides(board, updated_tetro)
  end

  def right(board) do
    updated_tetro = Tetromino.right(board.tetro)

    replace_unless_collides(board, updated_tetro)
  end

  def rotate(board) do
    updated_tetro = Tetromino.rotate_right_90(board.tetro)

    replace_unless_collides(board, updated_tetro)
  end

  def fall(board) do
    updated_tetro = Tetromino.fall(board.tetro)

    if collides?(board, updated_tetro) do
      crash(board)
    else
      %{board | tetro: updated_tetro}
    end
  end

  defp crash(board) do
    board
    |> Board.detach_tetro()
    |> Board.add_score()
    |> Board.new_tetro()
  end

  defp replace_unless_collides(board, tetro) do
    if not collides?(board, tetro) do
      %{board | tetro: tetro}
    else
      board
    end
  end

  defp collides?(board, tetro) do
    set =
      tetro
      |> Tetromino.to_group()
      |> MapSet.new()

    intersection = MapSet.intersection(set, board.points)

    MapSet.size(intersection) > 0
  end
end
