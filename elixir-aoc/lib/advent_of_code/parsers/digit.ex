defmodule AdventOfCode.Parsers.Digit do
  @moduledoc """
    A Parser that satisfies a UTF8 character thats digit between 0 or 9
  """
  import AdventOfCode.Parsers.Char
  import AdventOfCode.Parsers.Satisfy

  def digit, do: satisfy(char(), fn char -> char in ?0..?9 end)
end
