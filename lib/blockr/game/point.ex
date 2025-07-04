defmodule Blockr.Game.Point do
  def new(row, col) do
    {row, col}
  end

  def move_down({row, col}) do
    {row + 1, col}
  end

  def move_left({row, col}) do
    {row, col - 1}
  end

  def move_right({row, col}) do
    {row, col + 1}
  end

  def move_to({from_row, from_col}, {to_row, to_col}) do
    {from_row + to_row, from_col + to_col}
  end

  def swap({row, col}) do
    {col, row}
  end

  def flip_left_right({row, col}) do
    # point
    # |> Enum.map(fn {row, col} ->
    #   case {row, col} do
    #     {_, 1} -> {row, 4}
    #     {_, 2} -> {row, 3}
    #     {_, 3} -> {row, 2}
    #     {_, 4} -> {row, 1}
    #     _ -> {row, col}
    #   end
    # end)

    {row, 5 - col}
  end

  def flip_top_bottom({row, col}) do
    # point
    # |> Enum.map(fn {row, col} ->
    #   case {row, col} do
    #     {1, _} -> {4, col}
    #     {2, _} -> {3, col}
    #     {3, _} -> {2, col}
    #     {4, _} -> {1, col}
    #     _ -> {row, col}
    #   end
    # end)

    {5 - row, col}
  end

  def rotate(point, 0) do
    point
  end

  def rotate(point, 90) do
    point
    |> swap()
    |> flip_left_right()
  end

  def rotate(point, 180) do
    point
    |> flip_top_bottom()
    |> flip_left_right()
  end

  def rotate(point, 270) do
    point
    |> swap()
    |> flip_top_bottom()
  end

  def paint(point, color) do
    {point, color}
  end
end

# cx, cx, rx, ry, nx, ny
# 10  10  01  03
