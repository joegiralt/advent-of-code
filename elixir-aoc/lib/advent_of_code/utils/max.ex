defmodule AdventOfCode.Utils.Max do
  defp max([x]), do: x
  defp max([x | rest]), do: max(rest) |> Kernel.max(x)
end
