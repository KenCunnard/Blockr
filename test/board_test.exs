defmodule BoardTest do
  use ExUnit.Case

  alias Blockr.Game.Board

  test "Create a new board" do
    assert Board.new() == %Board{
             score: 0,
             tetro: :i,
             walls: [],
             junkyard: []
           }
  end
end
