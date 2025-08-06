defmodule Blockr.Game.Board do
  alias Blockr.Game.Shape
  alias Blockr.Game.Tetromino

  defstruct score: 0,
            tetro: nil,
            walls: [],
            junkyard: [],
            points: MapSet.new([])

  def new(options \\ []) do
    __struct__(options)
    |> new_tetro()
    |> add_walls()
  end

  def new_tetro(board) do
    random_tetro =
      Tetromino.new_random()

    positioned_tetro =
      %Blockr.Game.Tetromino{random_tetro | location: {5, 5}}

    %Blockr.Game.Board{board | tetro: positioned_tetro}
  end

  defp add_walls(board) do
    walls =
      for row <- 0..21, col <- 0..11, row in [0, 21] or col in [0, 11] do
        {row, col}
      end

    %Blockr.Game.Board{board | walls: walls, points: MapSet.new(walls)}
  end

  def detach_tetro(board) do
    points = Tetromino.to_group(board.tetro)
    colors = Shape.paint(points, board.tetro.name)

    updated_points = Enum.reduce(points, board.points, &MapSet.put(&2, &1))

    %{board | points: updated_points, junkyard: board.junkyard ++ colors}
    |> add_score()
  end

  def count_complete_rows(board) do
    board.junkyard
    |> Map.new()
    |> Map.keys()
    |> Enum.group_by(fn {row, _col} -> row end)
    |> Map.values()
    |> Enum.count(fn list -> length(list) == 10 end)
  end

  def add_score(board) do
    complete_rows = count_complete_rows(board)

    score_modifier =
      cond do
        complete_rows == 0 ->
          0

        true ->
          :math.pow(2, complete_rows)
          |> round()
          |> Kernel.*(50)
      end

    updated_score = board.score + score_modifier

    %{board | score: updated_score}
  end

  def show(board) do
    tetro =
      board.tetro
      |> Tetromino.to_group()
      |> Shape.paint(board.tetro.name)

    [tetro, board.walls, board.junkyard]
  end
end
