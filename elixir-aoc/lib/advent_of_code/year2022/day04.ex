defmodule AdventOfCode.Year2022.Day04 do
  @moduledoc "A Day 04 Solution."
  alias AdventOfCode.Year2022.Day04Parser

  def part_1 do
    Day04Parser.run()
    |> Enum.filter(&inclusive_sections?/1)
    |> Enum.count()
  end

  def part_2 do
    Day04Parser.run()
    |> Enum.filter(&overlapping_sections?/1)
    |> Enum.count()
  end

  defp inclusive_sections?([{x, y}, {a, b}]), do: (x <= a && y >= b) || (a <= x && b >= y)
  defp overlapping_sections?([{x, y}, {a, _b}]), do: x <= a && a <= y
end
