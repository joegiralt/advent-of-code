defmodule AdventOfCode.Parsers.Period do
  import AdventOfCode.Parsers.Char
  import AdventOfCode.Parsers.Satisfy

  def period, do: satisfy(char(), fn char -> char in [?.] end)
end
