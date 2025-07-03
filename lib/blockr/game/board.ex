defmodule Blockr.Game.Board do
  defstruct score: 0,
            tetro: nil,
            walls: [],
            junkyard: []

  def new(tetro \\ :i) do
    %__MODULE__{tetro: tetro}
  end
end
