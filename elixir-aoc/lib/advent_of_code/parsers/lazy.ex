defmodule AdventOfCode.Parsers.Lazy do
  def lazy(combinator) do
    fn input ->
      parser = combinator.()
      parser.(input)
    end
  end
end
