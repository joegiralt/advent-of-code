defmodule AdventOfCode.Parsers.Satisfy do
  @moduledoc """
    A Parser that takes a term if and checks if it satisfies
    the acceptor's value
  """
  def satisfy(parser, acceptor) do
    fn input ->
      with {:ok, term, rest} <- parser.(input) do
        if acceptor.(term),
          do: {:ok, term, rest},
          else: {:error, "term: `#{List.to_string([term])}` rejected"}
      end
    end
  end
end
