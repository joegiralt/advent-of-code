defmodule AdventOfCode.Parsers.NumericIdChar do
  @moduledoc """
    A Parser that checks if a characer can be apart of a numeric term
  """
  import AdventOfCode.Parsers.Choice
  import AdventOfCode.Parsers.Digit
  import AdventOfCode.Parsers.Period

  def numeric_id_char, do: choice([digit(), period()])
end
