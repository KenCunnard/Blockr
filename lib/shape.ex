defmodule Shape do
  # shape param is a list of points in the format ...
  # [{1, 2}, {2, 2}, {3, 2}, {4, 2}]
  #
  def move_down(shape) do
    Enum.map(shape, &Point.move_down(&1))
  end

  def move_left(shape) do
    Enum.map(shape, &Point.move_left(&1))
  end

  def move_right(shape) do
    Enum.map(shape, &Point.move_right(&1))
  end

  def move_to(shape, position) do
    Enum.map(shape, &Point.move_to(&1, position))
  end

  def swap(shape) do
    Enum.map(shape, &Point.swap/1)
  end

  def flip_left_right(shape) do
    Enum.map(shape, &Point.flip_left_right/1)
  end

  def flip_top_bottom(shape) do
    Enum.map(shape, &Point.flip_top_bottom/1)
  end

  def rotate(shape, degrees) do
    Enum.map(shape, &Point.rotate(&1, degrees))
  end

  def paint(shape, html_color_code) do
    Enum.map(shape, &Point.paint(&1, html_color_code))
  end
end
