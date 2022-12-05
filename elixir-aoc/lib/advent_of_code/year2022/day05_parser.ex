defmodule AdventOfCode.Year2022.Day05Parser do
  defmodule Command do
    defstruct [:move, :from, :to]

    def new(["move", move, "from", from, "to", to]) do
      %Command{
        move: move |> Integer.parse() |> elem(0),
        from: from |> Integer.parse() |> elem(0),
        to: to |> Integer.parse() |> elem(0)
      }
    end
  end

  @moduledoc """
    A normal Parser for day 05 Solution.
  """
  alias AdventOfCode.Utils.Matrix

  def run do
    [stacks, commands] =
      AdventOfCode.Input.get!(5, 2022)
      |> String.split("\n\n")

    {parse_stacks(stacks), parse_commands(commands)}
  end

  def parse_stacks(stacks) do
    # stacks
    # |> String.trim()
    # |> String.split("\n")
    # |> Enum.map(&parse_stack_line/1)
    # |> Enum.drop(-1)
    # |> Matrix.new()
    # |> Matrix.transpose()
    # |> filter_brackets_and_empty_spaces()

    stacks
    |> String.split("\n", trim: true)
    |> Enum.drop(-1)
    |> Enum.flat_map(fn line ->
      line |> String.graphemes() |> Enum.drop(1) |> Enum.take_every(4) |> Enum.with_index(1)
    end)
    |> Enum.group_by(&elem(&1, 1))
    |> Enum.map(fn {column, vals} ->
      {column, vals |> Enum.map(&elem(&1, 0)) |> Enum.reject(&Kernel.==(&1, " "))}
    end)
    |> Map.new()
  end

  def parse_stack_line(line) do
    line
    |> String.split("")
  end

  def parse_commands(commands) do
    commands
    |> String.split("\n")
    |> Enum.map(fn cmd ->
      cmd |> String.split(" ")
    end)
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
      |> Enum.filter(fn str -> str != "[" end)
      |> Enum.filter(fn str -> str != "]" end)
      |> Enum.filter(fn str -> str != " " end)
      |> Enum.filter(fn str -> str != "" end)
    end)
    |> Enum.filter(fn list -> list != [] end)
    |> Enum.with_index(1)
    |> Enum.map(fn {k, v} -> {v, k} end)
    |> Map.new()
  end
end
