defmodule Blockr.Game do
  # Functions that support gameplay
  # API
  # Guardrails for the user

  alias Blockr.Game.Tetromino

  def initialize_tetromino(board) do
    random_tetro =
      Tetromino.new_random()

    positioned_tetro =
      %Blockr.Game.Tetromino{random_tetro | location: {0, 50}}

    %Blockr.Game.Board{board | tetro: positioned_tetro}
  end

  def add_walls(board) do
    top_walls =
      1..10
      |> Enum.map(fn col -> {1, col} end)

    bottom_walls =
      1..10
      |> Enum.map(fn col -> {110, col} end)

    left_walls =
      1..20
      |> Enum.map(fn row -> {row, 1} end)

    right_walls =
      1..20
      |> Enum.map(fn row -> {row, 210} end)

    horizontal_walls = Enum.concat(top_walls, bottom_walls)
    vertical_walls = Enum.concat(left_walls, right_walls)

    walls = Enum.concat(horizontal_walls, vertical_walls)

    %Blockr.Game.Board{board | walls: walls}
  end
end
