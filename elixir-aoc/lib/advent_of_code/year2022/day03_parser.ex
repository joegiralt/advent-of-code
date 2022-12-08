defmodule AdventOfCode.Year2022.Day03Parser do
  @moduledoc """
    A normal Parser for day 03 Solution.
  """

  def run do
    AdventOfCode.Input.get!(3, 2022)
    |> String.trim()
    |> String.split("\n")
    |> Enum.map(&split_string_in_half/1)
    |> Enum.map(&convert_to_charlists/1)
  end

  defp split_string_in_half(str) do
    length = String.length(str)
    String.split_at(str, round(length / 2))
  end

  defp convert_to_charlists({front_of_ruck, back_of_ruck}) do
    front_set = front_of_ruck |> to_charlist |> MapSet.new()
    back_set = back_of_ruck |> to_charlist |> MapSet.new()
    {front_set, back_set}
  end
end
