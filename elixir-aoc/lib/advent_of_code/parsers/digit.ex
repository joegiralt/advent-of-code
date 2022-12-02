defmodule AdventOfCode.Parsers.Digit do
  import AdventOfCode.Parsers.Char
  import AdventOfCode.Parsers.Satisfy

  def digit, do: satisfy(char(), fn char -> char in ?0..?9 end)
end
