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
    |> initialize_tetromino()
    |> add_walls()
  end

  def initialize_tetromino(board) do
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

  def show(board) do
    tetro =
      board.tetro
      |> Tetromino.to_group()
      |> Shape.paint(board.tetro.name)

    [tetro, board.walls, board.junkyard]
  end
end
