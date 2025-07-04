defmodule PointTest do
  use ExUnit.Case

  alias Blockr.Game.Point

  test "Create new point" do
    assert Point.new(1, 1) == {1, 1}
  end

  test "Move point down" do
    assert Point.move_down({5, 6}) == {6, 6}
  end

  test "Move point left" do
    assert Point.move_left({5, 6}) == {5, 5}
  end

  test "Move point right" do
    assert Point.move_right({5, 6}) == {5, 7}
  end

  test "Move point to location" do
    assert Point.move_to({1, 1}, {3, 3}) == {4, 4}
  end

  test "Swap point row and column" do
    assert Point.swap({0, 1}) == {1, 0}
  end

  test "Flip point left to right" do
    assert Point.flip_left_right({1, 1}) == {1, 4}
  end

  test "Flip point top to bottom" do
    assert Point.flip_top_bottom({1, 1}) == {4, 1}
  end

  test "Rotate point 0 degrees" do
    assert Point.rotate({1, 1}, 0) == {1, 1}
  end

  test "Rotate point 90 degrees" do
    assert Point.rotate({1, 1}, 90) == {1, 4}
  end

  test "Rotate point 180 degrees" do
    assert Point.rotate({1, 1}, 180) == {4, 4}
  end

  test "Rotate point 270 degrees" do
    assert Point.rotate({1, 1}, 270) == {4, 1}
  end

  test "Paint point green" do
    assert Point.paint({1, 1}, "#BADA55") == {{1, 1}, "#BADA55"}
  end
end
