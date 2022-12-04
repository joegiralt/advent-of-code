defmodule AdventOfCode.Utils.IntersectionAll do
  @moduledoc """
    A Util func that returns the intersection of all sets in a list
  """
  def intersection_all([last]), do: last

  def intersection_all([head | tail]) do
    MapSet.intersection(head, intersection_all(tail))
  end
end
