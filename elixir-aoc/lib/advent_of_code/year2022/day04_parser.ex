defmodule AdventOfCode.Year2022.Day04Parser do
  @moduledoc """
    A normal Parser for day 03 Solution.
  """
  def run do
    AdventOfCode.Input.get!(4, 2022)
    |> String.trim()
    |> String.split("\n")
    |> Enum.map(fn string ->
      [a, b] = String.split(string, ",")
      [x, y] = String.split(a, "-")
      [c, d] = String.split(b, "-")

      [
        {
          x |> Integer.parse() |> elem(0),
          y |> Integer.parse() |> elem(0)
        },
        {
          c |> Integer.parse() |> elem(0),
          d |> Integer.parse() |> elem(0)
        }
      ]
      |> Enum.sort()
    end)
  end
end
