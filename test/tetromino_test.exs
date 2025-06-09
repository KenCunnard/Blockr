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
             {{2, 5}, "#BADA55"},
             {{3, 5}, "#BADA55"},
             {{4, 5}, "#BADA55"},
             {{5, 5}, "#BADA55"}
           ]
  end

  test "Group :l tetromino as points" do
    tetro = Tetromino.new(:l) |> Tetromino.to_group()

    assert tetro == [
             {{2, 5}, "#BADA55"},
             {{3, 5}, "#BADA55"},
             {{4, 5}, "#BADA55"},
             {{4, 6}, "#BADA55"}
           ]
  end

  test "Group :j tetromino as points" do
    tetro = Tetromino.new(:j) |> Tetromino.to_group()

    assert tetro == [
             {{2, 5}, "#BADA55"},
             {{3, 5}, "#BADA55"},
             {{4, 5}, "#BADA55"},
             {{4, 4}, "#BADA55"}
           ]
  end

  test "Group :t tetromino as points" do
    tetro = Tetromino.new(:t) |> Tetromino.to_group()

    assert tetro == [
             {{2, 4}, "#BADA55"},
             {{2, 5}, "#BADA55"},
             {{2, 6}, "#BADA55"},
             {{3, 5}, "#BADA55"}
           ]
  end

  test "Group :o tetromino as points" do
    tetro = Tetromino.new(:o) |> Tetromino.to_group()

    assert tetro == [
             {{2, 4}, "#BADA55"},
             {{2, 5}, "#BADA55"},
             {{3, 4}, "#BADA55"},
             {{3, 5}, "#BADA55"}
           ]
  end

  test "Group :s tetromino as points" do
    tetro = Tetromino.new(:s) |> Tetromino.to_group()

    assert tetro == [
             {{2, 5}, "#BADA55"},
             {{2, 6}, "#BADA55"},
             {{3, 5}, "#BADA55"},
             {{3, 4}, "#BADA55"}
           ]
  end

  test "Group :z tetromino as points" do
    tetro = Tetromino.new(:z) |> Tetromino.to_group()

    assert tetro == [
             {{2, 4}, "#BADA55"},
             {{2, 5}, "#BADA55"},
             {{3, 5}, "#BADA55"},
             {{3, 6}, "#BADA55"}
           ]
  end

  test "Rotate a :z tetromino right 90 degrees" do
    tetro = Tetromino.new(:z) |> Tetromino.rotate_right_90() |> Tetromino.to_group()

    assert tetro == [
             {{2, 7}, "#BADA55"},
             {{3, 7}, "#BADA55"},
             {{3, 6}, "#BADA55"},
             {{4, 6}, "#BADA55"}
           ]
  end
end
