defmodule AdventOfCode.Year2022.Day01 do
  def part_1() do
    AdventOfCode.Input.get!(1, 2022)
    |> String.trim()
    |> String.split("\n\n")
    |> Enum.map(&calories_per_elf/1)
    |> max()
  end

  def part_2() do
    AdventOfCode.Input.get!(1, 2022)
    |> String.trim()
    |> String.split("\n\n")
    |> Enum.map(&calories_per_elf/1)
    |> grab_top_three()
    |> Enum.sum()
  end

  defp grab_top_three(elf_calories) do
    [a, b, c | _rest] = Enum.sort(elf_calories) |> Enum.reverse()
    [a, b, c]
  end

  defp calories_per_elf(calorie_string) do
    calorie_string
    |> String.split("\n")
    |> Enum.map(fn elf_calories ->
      {int_val, ""} = Integer.parse(elf_calories)
      int_val
    end)
    |> Enum.sum()
  end

  defp max([x]), do: x
  defp max([x | rest]), do: max(rest) |> Kernel.max(x)
end
