defmodule Blockr.Game do
  alias Blockr.Game.Board
  alias Blockr.Game.Tetromino

  # Functions that support gameplay
  # API
  # Guardrails for the user
  #

  defstruct board: nil,
            player: nil

  def new(options \\ []) do
    __struct__(options)
  end

  def left(game) do
    updated_tetro = Tetromino.left(game.board.tetro)

    if should_move?(game.board, updated_tetro) do
      %Blockr.Game{
        game
        | board: %Blockr.Game.Board{
            game.board
            | tetro: updated_tetro
          }
      }
    else
      game
    end
  end

  def right(game) do
    updated_tetro = Tetromino.right(game.board.tetro)

    if should_move?(game.board, updated_tetro) do
      %Blockr.Game{
        game
        | board: %Blockr.Game.Board{
            game.board
            | tetro: updated_tetro
          }
      }
    else
      game
    end
  end

  def rotate(game) do
    updated_tetro = Tetromino.rotate_right_90(game.board.tetro)

    if should_move?(game.board, updated_tetro) do
      %Blockr.Game{
        game
        | board: %Blockr.Game.Board{
            game.board
            | tetro: updated_tetro
          }
      }
    else
      game
    end
  end

  defp should_move?(board, tetro) do
    board
    |> Board.show()
    |> List.flatten()
    |> Enum.member?(tetro.location)
    |> Kernel.not()
  end
end
