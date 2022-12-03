defmodule AdventOfCode.Utils.IntersectionAll do
  @moduledoc """
    A Util func that returns the intersection of all sets in a list
  """
  def intersection_all([x]), do: x

  def intersection_all([x | rest]) do
    MapSet.intersection(x, intersection_all(rest))
  end
end
