defmodule TetrominoTest do
  use ExUnit.Case

  test "Create new tetromino" do
    assert Tetromino.new() == %Tetromino{
             name: :i,
             location: {0, 0},
             rotation: 0,
             color: "#BADA55"
           }
  end

  test "Move tetromino left" do
    tetro = Tetromino.new()

    assert Tetromino.left(tetro) == %Tetromino{
             name: :i,
             location: {0, 0},
             rotation: 0,
             color: "#BADA55"
           }
  end

  test "Move tetromino right" do
    tetro = Tetromino.new()

    assert Tetromino.right(tetro) == %Tetromino{
             name: :i,
             location: {0, 1},
             rotation: 0,
             color: "#BADA55"
           }
  end

  test "Make tetromino fall" do
    tetro = Tetromino.new()

    assert Tetromino.fall(tetro) == %Tetromino{
             name: :i,
             location: {1, 0},
             rotation: 0,
             color: "#BADA55"
           }
  end

  test "Rotate tetromino right 90 degrees" do
    tetro =
      Tetromino.new()
      |> Tetromino.rotate_right_90()

    assert tetro == %Tetromino{
             name: :i,
             location: {0, 0},
             rotation: 90,
             color: "#BADA55"
           }
  end

  test "Rotate tetromino right 180 degrees" do
    tetro =
      Tetromino.new()
      |> Tetromino.rotate_right_90()
      |> Tetromino.rotate_right_90()

    assert tetro == %Tetromino{
             name: :i,
             location: {0, 0},
             rotation: 180,
             color: "#BADA55"
           }
  end

  test "Rotate tetromino right 270 degrees" do
    tetro =
      Tetromino.new()
      |> Tetromino.rotate_right_90()
      |> Tetromino.rotate_right_90()
      |> Tetromino.rotate_right_90()

    assert tetro == %Tetromino{
             name: :i,
             location: {0, 0},
             rotation: 270,
             color: "#BADA55"
           }
  end

  test "Rotate tetromino right 360 degrees" do
    tetro =
      Tetromino.new()
      |> Tetromino.rotate_right_90()
      |> Tetromino.rotate_right_90()
      |> Tetromino.rotate_right_90()
      |> Tetromino.rotate_right_90()

    assert tetro == %Tetromino{
             name: :i,
             location: {0, 0},
             rotation: 0,
             color: "#BADA55"
           }
  end

  test "Rotate tetromino right 450 degrees" do
    tetro =
      Tetromino.new()
      |> Tetromino.rotate_right_90()
      |> Tetromino.rotate_right_90()
      |> Tetromino.rotate_right_90()
      |> Tetromino.rotate_right_90()
      |> Tetromino.rotate_right_90()

    assert tetro == %Tetromino{
             name: :i,
             location: {0, 0},
             rotation: 90,
             color: "#BADA55"
           }
  end

  test "Group :i tetromino as points" do
    tetro = Tetromino.new(:i) |> Tetromino.to_group()

    assert tetro == [
             {{1, 2}, "#00FFFF"},
             {{2, 2}, "#00FFFF"},
             {{3, 2}, "#00FFFF"},
             {{4, 2}, "#00FFFF"}
           ]
  end

  test "Group :l tetromino as points" do
    tetro = Tetromino.new(:l) |> Tetromino.to_group()

    assert tetro == [
             {{1, 2}, "#FFA500"},
             {{2, 2}, "#FFA500"},
             {{3, 2}, "#FFA500"},
             {{3, 3}, "#FFA500"}
           ]
  end

  test "Group :j tetromino as points" do
    tetro = Tetromino.new(:j) |> Tetromino.to_group()

    assert tetro == [
             {{1, 2}, "#0000FF"},
             {{2, 2}, "#0000FF"},
             {{3, 2}, "#0000FF"},
             {{3, 1}, "#0000FF"}
           ]
  end

  test "Group :t tetromino as points" do
    tetro = Tetromino.new(:t) |> Tetromino.to_group()

    assert tetro == [
             {{1, 1}, "#800080"},
             {{1, 2}, "#800080"},
             {{1, 3}, "#800080"},
             {{2, 2}, "#800080"}
           ]
  end

  test "Group :o tetromino as points" do
    tetro = Tetromino.new(:o) |> Tetromino.to_group()

    assert tetro == [
             {{1, 1}, "#FFFF00"},
             {{1, 2}, "#FFFF00"},
             {{2, 1}, "#FFFF00"},
             {{2, 2}, "#FFFF00"}
           ]
  end

  test "Group :s tetromino as points" do
    tetro = Tetromino.new(:s) |> Tetromino.to_group()

    assert tetro == [
             {{1, 2}, "#008000"},
             {{1, 3}, "#008000"},
             {{2, 2}, "#008000"},
             {{2, 1}, "#008000"}
           ]
  end

  test "Group :z tetromino as points" do
    tetro = Tetromino.new(:z) |> Tetromino.to_group()

    assert tetro == [
             {{1, 1}, "#FF0000"},
             {{1, 2}, "#FF0000"},
             {{2, 2}, "#FF0000"},
             {{2, 3}, "#FF0000"}
           ]
  end

  test "Rotate a :z tetromino right 90 degrees" do
    tetro = Tetromino.new(:z) |> Tetromino.rotate_right_90() |> Tetromino.to_group()

    assert tetro == [
             {{1, 4}, "#FF0000"},
             {{2, 4}, "#FF0000"},
             {{2, 3}, "#FF0000"},
             {{3, 3}, "#FF0000"}
           ]
  end
end
