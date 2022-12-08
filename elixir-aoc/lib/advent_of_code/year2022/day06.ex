defmodule AdventOfCode.Year2022.Day06 do
  @moduledoc "A Day 06 Solution "
  alias AdventOfCode.Year2022.Day06Parser

  def part_1 do
    Day06Parser.run()
    |> buffer(4)
  end

  def part_2 do
    Day06Parser.run()
    |> buffer(14)
  end

  def buffer(charlist, size) do
    charlist
    |> Enum.chunk_every(size, 1)
    |> Enum.find_index(&(size == &1 |> Enum.uniq() |> length))
    |> Kernel.+(size)
  end
end
