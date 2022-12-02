defmodule AdventOfCode.Parsers.NumericIdChar do
  import AdventOfCode.Parsers.Choice
  import AdventOfCode.Parsers.Digit
  import AdventOfCode.Parsers.Period

  def numeric_id_char, do: choice([digit(), period()])
end
