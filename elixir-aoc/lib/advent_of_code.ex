defmodule AdventOfCode do
  @moduledoc """
  Documentation for project level AdventOfCode utils.
  """

  def default_year do
    case :calendar.local_time() do
      {{y, 12, _}, _} -> y
      {{y, _, _}, _} -> y - 1
    end
  end
end
