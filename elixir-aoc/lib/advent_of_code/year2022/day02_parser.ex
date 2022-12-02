defmodule AdventOfCode.Year2022.Day02Parser do
  def run do
    AdventOfCode.Input.get!(2, 2022)
    |> String.trim()
    |> String.split("\n")
    |> Enum.map(&String.split(&1, " "))
  end
end
