defmodule AdventOfCode.Utils.Max do
  def max([x]), do: x
  def max([x | rest]), do: max(rest) |> Kernel.max(x)
end
