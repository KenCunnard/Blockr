defmodule GameTest do
  use ExUnit.Case

  alias Blockr.Game
  alias Blockr.Game.Board

  test "Initializing a tetromino returns a Blockr.Game.Board" do
    board = Board.new()

    assert match?(%Blockr.Game.Board{}, Game.initialize_tetromino(board))
  end

  test "Add walls to a board" do
  end
end
