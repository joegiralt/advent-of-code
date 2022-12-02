defmodule AdventOfCode.Parsers.Sequence do
  @moduledoc """
    A Parser that takes a term if and checks if it satisfies
    a specific sequence of terms
  """
  def sequence(parsers) do
    fn input ->
      case parsers do
        [] ->
          {:ok, [], input}

        [first_parser | other_parsers] ->
          with {:ok, first_term, rest} <- first_parser.(input),
               {:ok, other_terms, rest} <- sequence(other_parsers).(rest),
               do: {:ok, [first_term | other_terms], rest}
      end
    end
  end
end
