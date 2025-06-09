defmodule CanvasTest do
  use ExUnit.Case

  test "Create new canvas" do
    tetro =
      Tetromino.new(:z)
      |> Tetromino.to_group()

    expected_result = %Kino.Image{
      content:
        "<svg width=\"100\" height=\"200\" xmlns=\"http://www.w3.org/2000/svg\">\n\n  <!-- Background -->\n  <rect width=\"100%\" height=\"100%\" fill=\"#F0F0F0\" />\n\n  <!-- Border -->\n  <rect width=\"100%\" height=\"100%\" fill=\"none\" stroke=\"black\" stroke-width=\"2\" />\n\n  <rect x=\"30\" y=\"10\" width=\"10\" height=\"10\" fill=\"#BADA55\" />\n<rect x=\"40\" y=\"10\" width=\"10\" height=\"10\" fill=\"#BADA55\" />\n<rect x=\"40\" y=\"20\" width=\"10\" height=\"10\" fill=\"#BADA55\" />\n<rect x=\"50\" y=\"20\" width=\"10\" height=\"10\" fill=\"#BADA55\" />\n</svg>\n",
      mime_type: "image/svg+xml"
    }

    assert Canvas.new(tetro) == expected_result
  end

  test "Create tetromino on canvas" do
    points = [
      {{2, 2}, "#BADA55"},
      {{3, 2}, "#BADA55"},
      {{4, 2}, "#BADA55"},
      {{4, 3}, "#BADA55"}
    ]

    expected_result = %Kino.Image{
      content:
        "<svg width=\"100\" height=\"100\" xmlns=\"http://www.w3.org/2000/svg\">\n  <rect x=\"25\" y=\"25\" width=\"25\" height=\"25\" fill=\"#BADA55\" />\n<rect x=\"25\" y=\"50\" width=\"25\" height=\"25\" fill=\"#BADA55\" />\n<rect x=\"25\" y=\"75\" width=\"25\" height=\"25\" fill=\"#BADA55\" />\n<rect x=\"50\" y=\"75\" width=\"25\" height=\"25\" fill=\"#BADA55\" />\n</svg>\n",
      mime_type: "image/svg+xml"
    }

    assert Canvas.tetromino(points) == expected_result
  end

  test "Draw a single point" do
    point = {{1, 1}, "#BADA55"}

    expected_result = "<rect x=\"0\" y=\"0\" width=\"25\" height=\"25\" fill=\"#BADA55\" />"

    assert Canvas.draw(point, 25) == expected_result
  end

  test "Draw a list of points" do
    points = [
      {{2, 2}, "#BADA55"},
      {{3, 2}, "#BADA55"},
      {{4, 2}, "#BADA55"},
      {{4, 3}, "#BADA55"}
    ]

    expected_result =
      "<rect x=\"25\" y=\"25\" width=\"25\" height=\"25\" fill=\"#BADA55\" />\n<rect x=\"25\" y=\"50\" width=\"25\" height=\"25\" fill=\"#BADA55\" />\n<rect x=\"25\" y=\"75\" width=\"25\" height=\"25\" fill=\"#BADA55\" />\n<rect x=\"50\" y=\"75\" width=\"25\" height=\"25\" fill=\"#BADA55\" />"

    assert Canvas.draw(points, 25) == expected_result
  end
end
