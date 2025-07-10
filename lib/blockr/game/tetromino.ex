defmodule Blockr.Game.Tetromino do
  alias Blockr.Game.Shape
  alias Blockr.Game.Point

  defstruct name: :i,
            # {row, col}
            location: {0, 0},
            rotation: 0

  def new() do
    %__MODULE__{}
  end

  def new(options) when is_list(options) do
    __struct__(options)
  end

  def new(name) do
    %__MODULE__{name: name}
  end

  def new_random() do
    [:i, :l, :j, :t, :o, :s, :z]
    |> Enum.random()
    |> new()
  end

  def left(tetro) do
    %{tetro | location: Point.move_left(tetro.location)}
  end

  def right(tetro) do
    %{tetro | location: Point.move_right(tetro.location)}
  end

  def fall(tetro) do
    %{tetro | location: Point.move_down(tetro.location)}
  end

  def rotate_right_90(tetro) do
    %{tetro | rotation: rem(tetro.rotation + 90, 360)}
  end

  def to_group(tetro) do
    case tetro.name do
      :i -> [{1, 2}, {2, 2}, {3, 2}, {4, 2}]
      :l -> [{1, 2}, {2, 2}, {3, 2}, {3, 3}]
      :j -> [{1, 2}, {2, 2}, {3, 2}, {3, 1}]
      :t -> [{1, 1}, {1, 2}, {1, 3}, {2, 2}]
      :o -> [{1, 1}, {1, 2}, {2, 1}, {2, 2}]
      :s -> [{1, 2}, {1, 3}, {2, 2}, {2, 1}]
      :z -> [{1, 1}, {1, 2}, {2, 2}, {2, 3}]
    end
    |> Shape.rotate(tetro.rotation)
    |> Shape.move_to(tetro.location)

    # |> Shape.paint(tetro.name)
  end
end
