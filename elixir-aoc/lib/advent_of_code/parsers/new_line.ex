
defmodule AdventOfCode.Parsers.NewLine do
  import AdventOfCode.Parsers.Satisfy
  import AdventOfCode.Parsers.Char

  def new_line, do: satisfy(char(), fn char -> char in [?\n] end)
end
