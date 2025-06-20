defmodule ShapeTest do
  use ExUnit.Case

  alias Blockr.Game.Shape
  alias Blockr.Game.Point

  # [{2, 2}, {3, 2}, {4, 2}, {4, 3}]

  test "Move shape down" do
    shape =
      [
        Point.new(2, 2),
        Point.new(3, 2),
        Point.new(4, 2),
        Point.new(4, 3)
      ]

    assert Shape.move_down(shape) == [{3, 2}, {4, 2}, {5, 2}, {5, 3}]
  end

  test "Move shape left" do
    shape =
      [
        Point.new(2, 2),
        Point.new(3, 2),
        Point.new(4, 2),
        Point.new(4, 3)
      ]

    assert Shape.move_left(shape) == [{2, 1}, {3, 1}, {4, 1}, {4, 2}]
  end

  test "Move shape right" do
    shape =
      [
        Point.new(2, 2),
        Point.new(3, 2),
        Point.new(4, 2),
        Point.new(4, 3)
      ]

    assert Shape.move_right(shape) == [{2, 3}, {3, 3}, {4, 3}, {4, 4}]
  end

  test "Move shape to location" do
    shape =
      [
        Point.new(2, 2),
        Point.new(3, 2),
        Point.new(4, 2),
        Point.new(4, 3)
      ]

    assert Shape.move_to(shape, {3, 3}) == [{5, 5}, {6, 5}, {7, 5}, {7, 6}]
  end

  test "Swap shape" do
    shape =
      [
        Point.new(2, 2),
        Point.new(3, 2),
        Point.new(4, 2),
        Point.new(4, 3)
      ]

    assert Shape.swap(shape) == [{2, 2}, {2, 3}, {2, 4}, {3, 4}]
  end

  test "Flip shape left to right" do
    shape =
      [
        Point.new(2, 2),
        Point.new(3, 2),
        Point.new(4, 2),
        Point.new(4, 3)
      ]

    assert Shape.flip_left_right(shape) == [{2, 3}, {3, 3}, {4, 3}, {4, 2}]
  end

  test "Flip shape top to bottom" do
    shape =
      [
        Point.new(2, 2),
        Point.new(3, 2),
        Point.new(4, 2),
        Point.new(4, 3)
      ]

    assert Shape.flip_top_bottom(shape) == [{3, 2}, {2, 2}, {1, 2}, {1, 3}]
  end

  test "Rotate shape 0 degrees" do
    shape =
      [
        Point.new(2, 2),
        Point.new(3, 2),
        Point.new(4, 2),
        Point.new(4, 3)
      ]

    assert Shape.rotate(shape, 0) == [{2, 2}, {3, 2}, {4, 2}, {4, 3}]
  end

  test "Rotate shape 90 degrees" do
    shape =
      [
        Point.new(2, 2),
        Point.new(3, 2),
        Point.new(4, 2),
        Point.new(4, 3)
      ]

    assert Shape.rotate(shape, 90) == [{2, 3}, {2, 2}, {2, 1}, {3, 1}]
  end

  test "Rotate shape 180 degrees" do
    shape =
      [
        Point.new(2, 2),
        Point.new(3, 2),
        Point.new(4, 2),
        Point.new(4, 3)
      ]

    assert Shape.rotate(shape, 180) == [{3, 3}, {2, 3}, {1, 3}, {1, 2}]
  end

  test "Rotate shape 270 degrees" do
    shape =
      [
        Point.new(2, 2),
        Point.new(3, 2),
        Point.new(4, 2),
        Point.new(4, 3)
      ]

    assert Shape.rotate(shape, 270) == [{3, 2}, {3, 3}, {3, 4}, {2, 4}]
  end

  test "Paint a shape" do
    shape =
      [
        Point.new(2, 2),
        Point.new(3, 2),
        Point.new(4, 2),
        Point.new(4, 3)
      ]

    assert Shape.paint(shape, :j) == [
             {{2, 2}, "blue"},
             {{3, 2}, "blue"},
             {{4, 2}, "blue"},
             {{4, 3}, "blue"}
           ]
  end
end
