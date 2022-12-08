defmodule AdventOfCode.Year2022.Day06Parser do
  @moduledoc """
    A normal Parser for day 06 Solution.
  """
  def run do
    AdventOfCode.Input.get!(6, 2022)
    |> String.trim()
    |> String.to_charlist()
  end
end
