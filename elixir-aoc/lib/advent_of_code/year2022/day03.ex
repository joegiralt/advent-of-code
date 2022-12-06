defmodule AdventOfCode.Year2022.Day03 do
  @moduledoc """
    A Day 03 Solution.
  """
  import AdventOfCode.Utils.IntersectionAll
  alias AdventOfCode.Year2022.Day03Parser

  @priority_mapping (Enum.zip(
                       ?a..?z |> Enum.to_list(),
                       1..26 |> Enum.to_list()
                     ) ++
                       Enum.zip(
                         ?A..?Z |> Enum.to_list(),
                         27..52 |> Enum.to_list()
                       ))
                    |> Map.new()

  def part_1() do
    Day03Parser.run()
    |> Enum.map(&find_intersections_in_ruck_sack_sections/1)
    |> Enum.map(&score_priority_item/1)
    |> Enum.sum()
  end

  def part_2() do
    Day03Parser.run()
    |> Enum.map(&find_unions_in_ruck_sack_sections/1)
    |> Enum.chunk_every(3)
    |> Enum.map(&find_intersections_in_elf_group/1)
    |> Enum.map(&score_priority_item/1)
    |> Enum.sum()
  end

  defp score_priority_item(ruck_item) do
    @priority_mapping[hd(ruck_item)]
  end

  defp find_intersections_in_elf_group([a, b, c]) do
    [a, b, c]
    |> intersection_all()
    |> Enum.to_list()
  end

  defp find_intersections_in_ruck_sack_sections({front_of_ruck, back_of_ruck}) do
    MapSet.intersection(front_of_ruck, back_of_ruck)
    |> Enum.to_list()
  end

  defp find_unions_in_ruck_sack_sections({front_of_ruck, back_of_ruck}) do
    MapSet.union(front_of_ruck, back_of_ruck)
  end
end
