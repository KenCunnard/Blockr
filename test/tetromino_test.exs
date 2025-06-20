defmodule TetrominoTest do
  use ExUnit.Case

  alias Blockr.Game.Tetromino

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
             {{1, 2}, "cyan"},
             {{2, 2}, "cyan"},
             {{3, 2}, "cyan"},
             {{4, 2}, "cyan"}
           ]
  end

  test "Group :l tetromino as points" do
    tetro = Tetromino.new(:l) |> Tetromino.to_group()

    assert tetro == [
             {{1, 2}, "orange"},
             {{2, 2}, "orange"},
             {{3, 2}, "orange"},
             {{3, 3}, "orange"}
           ]
  end

  test "Group :j tetromino as points" do
    tetro = Tetromino.new(:j) |> Tetromino.to_group()

    assert tetro == [
             {{1, 2}, "blue"},
             {{2, 2}, "blue"},
             {{3, 2}, "blue"},
             {{3, 1}, "blue"}
           ]
  end

  test "Group :t tetromino as points" do
    tetro = Tetromino.new(:t) |> Tetromino.to_group()

    assert tetro == [
             {{1, 1}, "purple"},
             {{1, 2}, "purple"},
             {{1, 3}, "purple"},
             {{2, 2}, "purple"}
           ]
  end

  test "Group :o tetromino as points" do
    tetro = Tetromino.new(:o) |> Tetromino.to_group()

    assert tetro == [
             {{1, 1}, "yellow"},
             {{1, 2}, "yellow"},
             {{2, 1}, "yellow"},
             {{2, 2}, "yellow"}
           ]
  end

  test "Group :s tetromino as points" do
    tetro = Tetromino.new(:s) |> Tetromino.to_group()

    assert tetro == [
             {{1, 2}, "green"},
             {{1, 3}, "green"},
             {{2, 2}, "green"},
             {{2, 1}, "green"}
           ]
  end

  test "Group :z tetromino as points" do
    tetro = Tetromino.new(:z) |> Tetromino.to_group()

    assert tetro == [
             {{1, 1}, "red"},
             {{1, 2}, "red"},
             {{2, 2}, "red"},
             {{2, 3}, "red"}
           ]
  end

  test "Rotate a :z tetromino right 90 degrees" do
    tetro = Tetromino.new(:z) |> Tetromino.rotate_right_90() |> Tetromino.to_group()

    assert tetro == [
             {{1, 4}, "red"},
             {{2, 4}, "red"},
             {{2, 3}, "red"},
             {{3, 3}, "red"}
           ]
  end
end
