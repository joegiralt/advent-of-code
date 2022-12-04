defmodule AdventOfCode.Year2022.Day04 do
  @moduledoc """
    A Day 04 Solution.
  """
  alias AdventOfCode.Year2022.Day04Parser

  def part_1 do
    Day04Parser.run()
    |> Enum.filter(&has_inclusive_sections/1)
    |> Enum.count()
  end

  def part_2 do
    Day04Parser.run()
    |> Enum.filter(&has_over_lapping_sections/1)
    |> Enum.count()
  end

  def has_inclusive_sections([{x, y}, {a, b}]), do: (x <= a && y >= b) || (a <= x && b >= y)
  def has_over_lapping_sections([{x, y}, {a, b}]), do: x <= a && a <= y
end
