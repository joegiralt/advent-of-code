defmodule AdventOfCode.Year2022.Day01Parser do
  @moduledoc """
    A Parser Combinator for day 01 Solution.
  """
  import AdventOfCode.Parsers.NewLine
  import AdventOfCode.Parsers.Map
  import AdventOfCode.Parsers.NumericValue
  import AdventOfCode.Parsers.SeperatedList
  import AdventOfCode.Parsers.Sequence
  import AdventOfCode.Parsers.Satisfy

  def run do
    AdventOfCode.Input.get!(1, 2022)
    |> String.trim()
    |> parse
  end

  defp parse(input) do
    parser = all_elves
    parser.(input)
  end

  def delimiter() do
    satisfy(
      sequence([new_line(), new_line()]),
      fn chars -> chars != [] end
    )
    |> map(fn _ -> :delimiter end)
  end

  def calorie() do
    satisfy(
      sequence([numeric_value(), new_line()]),
      fn chars -> chars != [] end
    )
  end

  def all_elves, do: separated_list(elf(), delimiter())

  def elf do
    separated_list(numeric_value(), new_line())
    |> map(fn char_lists_elf_calories ->
      char_lists_elf_calories
      |> Enum.map(fn item ->
        {calories, _} =
          item
          |> to_string
          |> Integer.parse()

        calories
      end)
    end)
  end
end
