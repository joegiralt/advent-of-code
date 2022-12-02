defmodule AdventOfCode.Year2022.Day01 do
  alias AdventOfCode.Year2022.Day01Parser, as: ParseInput
  import AdventOfCode.Utils.Max

  def part_1() do
    {:ok, ast, _} = ParseInput.run()

    ast
    |> Enum.map(&calories_per_elf/1)
    |> max()
  end

  def part_2() do
    {:ok, ast, _} = ParseInput.run()

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

  defp max([x]), do: x
  defp max([x | rest]), do: max(rest) |> Kernel.max(x)
end

AdventOfCode.Year2022.Day01

Benchee.run(
  %{
    "Day 1, Part 1" => fn -> AdventOfCode.Year2022.Day01 end,
    "Day 1, Part 2" => fn -> AdventOfCode.Year2022.Day02 end,
  }
)
