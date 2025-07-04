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

  # # Function head method
  # def rotate_right_90(%{rotation: 270} = tetro) do
  #   %{tetro | location: Point.rotate(tetro.location, 90), rotation: 0}
  # end

  # def rotate_right_90(tetro) do
  #   %{tetro | location: Point.rotate(tetro.location, 90), rotation: tetro.rotation + 90}
  # end

  # # Math method
  # def rotate_right_90(tetro) do
  #   %{tetro | location: Point.rotate(tetro.location, 90), rotation: rem(tetro.rotation + 90, 360)}
  # end

  # Helper function method
  # def rotate_right_90(tetro) do
  #   updated_rotation = update_rotation(tetro.rotation)

  #   %{tetro | location: Point.rotate(tetro.location, 90), rotation: updated_rotation}
  # end

  # def update_rotation(270), do: 0
  # def update_rotation(rotation), do: rotation + 90

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
    |> Shape.paint(tetro.name)
  end

  # Multiple function heads is not idiomatic, use cond or case in one function
  # def to_group(%{name: :t, rotation: rotation} = _tetro) do
  #   shape = [{1, 1}, {1, 2}, {1, 3}, {2, 2}]
  #   Shape.rotate(shape, rotation)
  # end

  # def to_group(%{name: :l, rotation: rotation} = _tetro) do
  #   shape = [{1, 2}, {2, 2}, {3, 2}, {3, 3}]
  #   Shape.rotate(shape, rotation)
  # end

  # def to_group(%{name: :j, rotation: rotation} = _tetro) do
  #   shape = [{1, 2}, {2, 2}, {3, 2}, {3, 1}]
  #   Shape.rotate(shape, rotation)
  # end

  # def to_group(%{name: :i, rotation: rotation} = _tetro) do
  #   shape = [{1, 2}, {2, 2}, {3, 2}, {4, 2}]
  #   Shape.rotate(shape, rotation)
  # end

  # def to_group(%{name: :o, rotation: rotation} = _tetro) do
  #   shape = [{1, 1}, {1, 2}, {2, 1}, {2, 2}]
  #   Shape.rotate(shape, rotation)
  # end

  # def to_group(%{name: :s, rotation: rotation} = _tetro) do
  #   shape = [{1, 2}, {1, 3}, {2, 2}, {2, 1}]
  #   Shape.rotate(shape, rotation)
  # end

  # def to_group(%{name: :z, rotation: rotation} = _tetro) do
  #   shape = [{1, 1}, {1, 2}, {2, 2}, {2, 3}]
  #   Shape.rotate(shape, rotation)
  # end
end
