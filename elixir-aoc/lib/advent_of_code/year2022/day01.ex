defmodule AdventOfCode.Year2022.Day01 do
  @moduledoc """
    A Day 01 Solution.
  """
  alias AdventOfCode.Year2022.Day01Parser
  import AdventOfCode.Utils.Max

  def part_1() do
    {:ok, ast, _} = Day01Parser.run()

    ast
    |> Enum.map(&calories_per_elf/1)
    |> max()
  end

  def part_2() do
    {:ok, ast, _} = Day01Parser.run()

    ast
    |> Enum.map(&calories_per_elf/1)
    |> grab_top_three()
    |> Enum.sum()
  end

  defp grab_top_three(elf_calories) do
    elf_calories
    |> Enum.sort()
    |> Enum.take(-3)
  end

  defp calories_per_elf(calories) do
    calories
    |> Enum.sum()
  end
end
