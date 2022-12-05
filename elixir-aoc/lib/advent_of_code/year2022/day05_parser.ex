defmodule AdventOfCode.Year2022.Day05Parser do
  @moduledoc """
    A normal Parser for day 05 Solution.
  """
  defmodule Command do
    @moduledoc """
      A module to make structs for commands
    """
    defstruct [:move, :from, :to]

    def new(["move", move, "from", from, "to", to]) do
      %Command{
        move: move |> Integer.parse() |> elem(0),
        from: from |> Integer.parse() |> elem(0),
        to: to |> Integer.parse() |> elem(0)
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

  def parse_stacks(stacks) do
    stacks
    |> String.split("\n", trim: true)
    |> Enum.map(&parse_stack_line/1)
    |> Enum.drop(-1)
    |> Matrix.new()
    |> Matrix.transpose()
    |> filter_brackets_and_empty_spaces()
  end

  def parse_stack_line(line), do: line |> String.split("")

  def parse_commands(commands) do
    commands
    |> String.split("\n")
    |> Enum.map(fn cmd ->
      cmd |> String.split(" ")
    end)
    |> Enum.drop(-1)
    |> Enum.map(&Command.new/1)
  end

  def remove_first_line(%Matrix{data: data}) do
    [_head | tail] = data
    Matrix.new(tail)
  end

  def filter_brackets_and_empty_spaces(%Matrix{data: data}) do
    data
    |> Enum.map(fn stack_line ->
      stack_line
      |> Enum.reject(&rejector/1)
    end)
    |> Enum.filter(fn list -> list != [] end)
    |> Enum.with_index(1)
    |> Enum.map(fn {k, v} -> {v, k} end)
    |> Map.new()
  end

  def rejector(str), do: str in ["[", "]", " ", ""]
end
