defmodule AdventOfCode.Parsers.Many do
  @moduledoc """
    A Parser that greedily checks if adjacent terms are of the same
    kind/grammar
  """
  def many(parser) do
    fn input ->
      case parser.(input) do
        {:error, _reason} ->
          {:ok, [], input}

        {:ok, first_term, rest} ->
          {:ok, other_terms, rest} = many(parser).(rest)
          {:ok, [first_term | other_terms], rest}
      end
    end
  end
end
