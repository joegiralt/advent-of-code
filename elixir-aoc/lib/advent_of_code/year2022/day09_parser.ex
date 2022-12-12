defmodule AdventOfCode.Year2022.Day09Parser do
  @moduledoc " A normal Parser for day 09 Solution. "
  def run do
    AdventOfCode.Input.get!(9, 2022)
    |> String.split("\n", trim: true)
    |> Enum.flat_map(fn line ->
      [dir, steps] = String.split(line)
      List.duplicate(dir, String.to_integer(steps))
    end)
  end
end
