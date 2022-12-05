defmodule AdventOfCode.Utils.Matrix do
  @moduledoc """
    A small Matrix helper library.
  """

  defstruct data: nil, width: nil, depth: nil

  alias __MODULE__, as: M

  def new(two_dee_array) do
    %M{
      data: two_dee_array,
      width: two_dee_array |> List.first() |> Enum.count(),
      depth: Enum.count(two_dee_array)
    }
  end

  def unwrap(%M{data: data}) do
    data
  end

  def transpose(%M{data: data}) do
    List.zip(data)
    |> Enum.map(&Tuple.to_list(&1))
    |> new
  end

  def list_matrix_from_grid(points, m, n, default \\ :x) do
    two_dee = for _ <- 1..m, do: for(_ <- 1..n, do: default)

    Enum.reduce(points, two_dee, fn {{row, col} = _point, val}, acc ->
      acc
      |> Enum.with_index()
      |> Enum.map(&list_matrix_from_grid_helper(&1, row, col, val))
    end)
    |> M.new()
  end

  defp list_matrix_from_grid_helper({list, idx}, row, col, val) do
    if idx == row do
      list |> List.update_at(col, fn _ -> val end)
    else
      list
    end
  end
end
