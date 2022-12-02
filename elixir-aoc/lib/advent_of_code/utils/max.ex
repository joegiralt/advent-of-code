defmodule AdventOfCode.Utils.Max do
  @moduledoc """
    A Util func that returns the Max value for a List
  """

  def max([x]), do: x
  def max([x | rest]), do: max(rest) |> Kernel.max(x)
end
