defmodule AdventOfCode.Year2022.Day05 do
  @moduledoc """
    A Day 05 Solution.
  """
  alias AdventOfCode.Year2022.Day05Parser

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
    |> Enum.map_join("", &List.first/1)
  end

  def reduce_cmds({cargo_stacks, []}, _part), do: cargo_stacks

  def reduce_cmds({cargo_stacks, commands}, part) do
    [cmd | rest_of_commands] = commands

    {modded_cargo, cargo_to_move} =
      take(cargo_stacks[cmd.from_cargo_location], [], cmd.amount_to_move)

    cargo_to_stack = add(part, cargo_to_move, cargo_stacks[cmd.to_cargo_location])

    newly_mapped_cargo_stacks =
      cargo_stacks
      |> Map.update(cmd.from_cargo_location, modded_cargo, fn _ -> modded_cargo end)
      |> Map.update(cmd.to_cargo_location, cargo_to_stack, fn _ -> cargo_to_stack end)

    reduce_cmds({newly_mapped_cargo_stacks, rest_of_commands}, part)
  end

  # Takes items off of cargo stack
  def take(modded_cargo, cargo_to_move, 0), do: {modded_cargo, cargo_to_move}

  def take([top_cargo_item | rest_of_cargo] = _modded_cargo, cargo_to_move, amount_left_to_move) do
    take(
      rest_of_cargo,
      [top_cargo_item | cargo_to_move],
      amount_left_to_move - 1
    )
  end

  # Adds new items to a cargo stack depending on crane type
  def add(_part, [], cargo_stack), do: cargo_stack

  def add(:part_1, new_cargo, cargo_stack) do
    new_cargo ++ cargo_stack
  end

  def add(:part_2, [new_cargo_item | rest_of_new_cargo] = _new_cargo, cargo_stack) do
    add(
      :part_2,
      rest_of_new_cargo,
      [new_cargo_item | cargo_stack]
    )
  end
end
