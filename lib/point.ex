defmodule Point do
  def new(row, col) do
    {row, col}
  end

  # my attempt at move_down()
  # def move_down(point) do
  #   x = elem(point, 0)
  #   new_point = put_elem(point, 0, x + 1)

  #   new_point
  # end

  def move_down({row, col}) do
    # TODO: Prevent moving below the board
    # case row do
    #   0 ->
    #     {0, col}

    #   row when row > 0 ->
    #     {row + 1}

    #   _ ->
    #     {:error, :not_a_valid_row}
    # end

    {row + 1, col}
  end

  def move_left({row, col}) do
    case col do
      0 ->
        {row, 0}

      col when col > 0 and is_number(col) ->
        {row, col - 1}

      _ ->
        {:error, :not_a_valid_column}
    end
  end

  def move_right({row, col}) do
    # TODO: Prevent moving beyond the right of the board
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

  def paint(point, html_color_code) do
    {point, html_color_code}
  end
end

# cx, cx, rx, ry, nx, ny
# 10  10  01  03
