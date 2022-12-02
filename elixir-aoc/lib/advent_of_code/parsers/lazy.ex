defmodule AdventOfCode.Parsers.Lazy do
  @moduledoc """
    A Parser that lazily evaluates the passed combinator
  """
  def lazy(combinator) do
    fn input ->
      parser = combinator.()
      parser.(input)
    end
  end
end
