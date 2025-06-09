defmodule TetrominoTest do
  use ExUnit.Case

  test "Create new tetromino" do
    assert Tetromino.new() == %Tetromino{
             name: :i,
             location: {1, 3},
             rotation: 0,
             color: "#BADA55"
           }
  end

  test "Move tetromino left" do
    tetro = Tetromino.new()

    assert Tetromino.left(tetro) == %Tetromino{
             name: :i,
             location: {1, 2},
             rotation: 0,
             color: "#BADA55"
           }
  end

  test "Move tetromino right" do
    tetro = Tetromino.new()

    assert Tetromino.right(tetro) == %Tetromino{
             name: :i,
             location: {1, 4},
             rotation: 0,
             color: "#BADA55"
           }
  end

  test "Make tetromino fall" do
    tetro = Tetromino.new()

    assert Tetromino.fall(tetro) == %Tetromino{
             name: :i,
             location: {2, 3},
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
             location: {1, 3},
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
             location: {1, 3},
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
             location: {1, 3},
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
             location: {1, 3},
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
             location: {1, 3},
             rotation: 90,
             color: "#BADA55"
           }
  end

  test "Group :i tetromino as points" do
    tetro = Tetromino.new(:i) |> Tetromino.to_group()

    assert tetro == [
             {{2, 5}, "#00FFFF"},
             {{3, 5}, "#00FFFF"},
             {{4, 5}, "#00FFFF"},
             {{5, 5}, "#00FFFF"}
           ]
  end

  test "Group :l tetromino as points" do
    tetro = Tetromino.new(:l) |> Tetromino.to_group()

    assert tetro == [
             {{2, 5}, "#FFA500"},
             {{3, 5}, "#FFA500"},
             {{4, 5}, "#FFA500"},
             {{4, 6}, "#FFA500"}
           ]
  end

  test "Group :j tetromino as points" do
    tetro = Tetromino.new(:j) |> Tetromino.to_group()

    assert tetro == [
             {{2, 5}, "#0000FF"},
             {{3, 5}, "#0000FF"},
             {{4, 5}, "#0000FF"},
             {{4, 4}, "#0000FF"}
           ]
  end

  test "Group :t tetromino as points" do
    tetro = Tetromino.new(:t) |> Tetromino.to_group()

    assert tetro == [
             {{2, 4}, "#800080"},
             {{2, 5}, "#800080"},
             {{2, 6}, "#800080"},
             {{3, 5}, "#800080"}
           ]
  end

  test "Group :o tetromino as points" do
    tetro = Tetromino.new(:o) |> Tetromino.to_group()

    assert tetro == [
             {{2, 4}, "#FFFF00"},
             {{2, 5}, "#FFFF00"},
             {{3, 4}, "#FFFF00"},
             {{3, 5}, "#FFFF00"}
           ]
  end

  test "Group :s tetromino as points" do
    tetro = Tetromino.new(:s) |> Tetromino.to_group()

    assert tetro == [
             {{2, 5}, "#008000"},
             {{2, 6}, "#008000"},
             {{3, 5}, "#008000"},
             {{3, 4}, "#008000"}
           ]
  end

  test "Group :z tetromino as points" do
    tetro = Tetromino.new(:z) |> Tetromino.to_group()

    assert tetro == [
             {{2, 4}, "#FF0000"},
             {{2, 5}, "#FF0000"},
             {{3, 5}, "#FF0000"},
             {{3, 6}, "#FF0000"}
           ]
  end

  test "Rotate a :z tetromino right 90 degrees" do
    tetro = Tetromino.new(:z) |> Tetromino.rotate_right_90() |> Tetromino.to_group()

    assert tetro == [
             {{2, 7}, "#FF0000"},
             {{3, 7}, "#FF0000"},
             {{3, 6}, "#FF0000"},
             {{4, 6}, "#FF0000"}
           ]
  end
end
