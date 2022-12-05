defmodule AdventOfCode.Year2022.Day05 do
  alias AdventOfCode.Year2022.Day05Parser
  alias AdventOfCode.Year2022.Day05Parser.Command

  def part_1 do
    Day05Parser.run()
    |> reduce_cmds(:part_1)
    |> grab_top_cargo()
  end

  def part_2 do
    Day05Parser.run()
    |> reduce_cmds(:part_2)
    |> grab_top_cargo()
  end

  def grab_top_cargo(stacks) do
    stacks
    |> Map.values()
    |> Enum.map(fn [head | tail] -> head end)
    |> Enum.join("")
  end

  def reduce_cmds({stacks, []}, part), do: stacks

  def reduce_cmds({stacks, commands}, part) do
    [cmd | tail] = commands

    {modded_stack, items_to_move} = take(stacks[cmd.from], [], cmd.move)
    added_to_stack = add(part, items_to_move, stacks[cmd.to])

    newly_mapped_stacks =
      stacks
      |> Map.update(cmd.from, modded_stack, fn _ -> modded_stack end)
      |> Map.update(cmd.to, added_to_stack, fn _ -> added_to_stack end)

    reduce_cmds({newly_mapped_stacks, tail}, part)
  end

  def take(list, result, 0), do: {list, result}

  def take(list, result, number) do
    [head | tail] = list
    take(tail, [head | result], number - 1)
  end

  def add(_, [], stack), do: stack

  def add(:part_1, new_items, stack) do
    new_items ++ stack
  end

  def add(:part_2, new_items, stack) do
    [new_item | tail] = new_items
    add(:part_2, tail, [new_item | stack])
  end
end
