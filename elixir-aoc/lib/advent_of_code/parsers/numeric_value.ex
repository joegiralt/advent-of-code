defmodule AdventOfCode.Parsers.NumericValue do
  import AdventOfCode.Parsers.Satisfy
  import AdventOfCode.Parsers.Many
  import AdventOfCode.Parsers.NumericIdChar

  def numeric_value() do
    satisfy(
      many(numeric_id_char()),
      fn chars -> chars != [] end
    )
  end
end
