defmodule Blockr.Game do
  alias Blockr.Game.Shape
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

  def fall(board) do
    updated_tetro = Tetromino.fall(board.tetro)

    attempt_move(board, updated_tetro)
  end

  defp attempt_move(board, tetro) do
    set =
      tetro
      |> Tetromino.to_group()
      |> MapSet.new()

    junk = Enum.map(board.junkyard, fn {point, _color} -> point end)
    points = board.points |> MapSet.to_list()

    updated_points =
      [junk | points]
      |> List.flatten()
      |> MapSet.new()

    updated_junkyard =
      [tetro |> Tetromino.to_group() |> Shape.paint(tetro.name) | board.junkyard]

    intersection = MapSet.intersection(set, updated_points)

    should_move? = MapSet.size(intersection) == 0

    if should_move? do
      %{board | tetro: tetro}
    else
      %{board | tetro: nil, points: updated_points, junkyard: updated_junkyard}
    end
  end
end
