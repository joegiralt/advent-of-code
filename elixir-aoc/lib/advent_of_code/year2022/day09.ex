defmodule AdventOfCode.Year2022.Day09 do
  @moduledoc "A Day 09 Solution "
  alias AdventOfCode.Year2022.Day09Parser

  def part_1 do
    Day09Parser.run()
    |> move([{0, 0}, {0, 0}], MapSet.new())
    |> MapSet.size()
  end

  def part_2 do
    Day09Parser.run()
    |> move(List.duplicate({0, 0}, 10), MapSet.new())
    |> MapSet.size()
  end

  defp move([], _rope, tail_path) do
    tail_path
  end

  defp move([dir | rest], [head | knots], tail_path) do
    new_head = move_head(dir, head)
    new_rope = Enum.scan([new_head | knots], fn tail, head -> follow(head, tail) end)
    move(rest, new_rope, MapSet.put(tail_path, Enum.at(new_rope, -1)))
  end

  defp move_head("L", {x, y}), do: {x - 1, y}
  defp move_head("R", {x, y}), do: {x + 1, y}
  defp move_head("U", {x, y}), do: {x, y + 1}
  defp move_head("D", {x, y}), do: {x, y - 1}

  defp follow({hx, hy}, {tx, ty} = tail) do
    if abs(hx - tx) <= 1 and abs(hy - ty) <= 1 do
      tail
    else
      {coordinate(hx, tx), coordinate(hy, ty)}
    end
  end

  defp coordinate(h, t) do
    cond do
      h == t -> t
      h > t -> t + 1
      h < t -> t - 1
    end
  end
end
