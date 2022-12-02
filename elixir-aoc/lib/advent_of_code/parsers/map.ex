defmodule AdventOfCode.Parsers.Map do
  @moduledoc """
    A Parser that maps the term to some sort of ast/data_structure
  """
  def map(parser, mapper) do
    fn input ->
      with {:ok, term, rest} <- parser.(input),
           do: {:ok, mapper.(term), rest}
    end
  end
end
