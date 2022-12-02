defmodule AdventOfCode.Parsers.Map do
  def map(parser, mapper) do
    fn input ->
      with {:ok, term, rest} <- parser.(input),
           do: {:ok, mapper.(term), rest}
    end
  end
end
