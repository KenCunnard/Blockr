defmodule Canvas do
  def new(points) do
    """
    <svg width="100" height="200" xmlns="http://www.w3.org/2000/svg">

      <!-- Background -->
      <rect width="100%" height="100%" fill="#F0F0F0" />

      <!-- Border -->
      <rect width="100%" height="100%" fill="none" stroke="black" stroke-width="2" />

      #{draw(points, 10)}
    </svg>
    """
    |> Kino.Image.new(:svg)
  end

  def tetromino(points) do
    """
    <svg width="100" height="100" xmlns="http://www.w3.org/2000/svg">
      #{draw(points, 25)}
    </svg>
    """
    |> Kino.Image.new(:svg)
  end

  def draw({{row, col}, color}, width) do
    x = (col - 1) * width
    y = (row - 1) * width

    ~s[<rect x="#{x}" y="#{y}" width="#{width}" height="#{width}" fill="#{color}" />]
  end

  def draw({_row, _col} = point, width) do
    draw({point, "black"}, width)
  end

  def draw(points, width) when is_list(points) do
    points
    |> Enum.map(&draw(&1, width))
    |> Enum.join("\n")
  end
end
