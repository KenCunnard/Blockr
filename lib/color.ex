defmodule Color do
  def for(shape_name) do
    case shape_name do
      :i -> "cyan"
      :l -> "orange"
      :j -> "blue"
      :t -> "purple"
      :o -> "yellow"
      :s -> "green"
      :z -> "red"
    end
  end
end
