defmodule AdventOfCode.Year2022.Day05Parser do
  @moduledoc """
    A normal Parser for day 05 Solution.
  """
  defmodule Command do
    @moduledoc """
      A module to make structs for commands
    """
    defstruct [:amount_to_move, :from_cargo_location, :to_cargo_location]

    def new(["move", move, "from", from, "to", to]) do
      %Command{
        amount_to_move: move |> Integer.parse() |> elem(0),
        from_cargo_location: from |> Integer.parse() |> elem(0),
        to_cargo_location: to |> Integer.parse() |> elem(0)
      }
    end
  end

  alias AdventOfCode.Utils.Matrix

  def run do
    [stacks, commands] =
      AdventOfCode.Input.get!(5, 2022)
      |> String.split("\n\n")

    {parse_stacks(stacks), parse_commands(commands)}
  end

  defp parse_stacks(stacks) do
    stacks
    |> String.split("\n", trim: true)
    |> Enum.map(&parse_stack_line/1)
    |> Enum.drop(-1)
    |> Matrix.new()
    |> Matrix.transpose()
    |> filter_brackets_and_empty_spaces()
  end

  defp parse_stack_line(line), do: line |> String.split("")

  defp parse_commands(commands) do
    commands
    |> String.split("\n")
    |> Enum.map(fn cmd ->
      cmd |> String.split(" ")
    end)
    |> Enum.drop(-1)
    |> Enum.map(&Command.new/1)
  end

  defp remove_first_line(%Matrix{data: data}) do
    [_head | tail] = data
    Matrix.new(tail)
  end

  defp filter_brackets_and_empty_spaces(%Matrix{data: data}) do
    data
    |> Enum.map(fn stack_line -> stack_line |> Enum.reject(&rejector/1) end)
    |> Enum.reject(fn list -> list == [] end)
    |> Enum.with_index(1)
    |> Enum.map(fn {k, v} -> {v, k} end)
    |> Map.new()
  end

  defp rejector(str), do: str in ["[", "]", " ", ""]
end
