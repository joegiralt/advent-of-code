defmodule AdventOfCode.Parsers.NewLine do
  @moduledoc """
    A Parser that checks if a term is a new_line
  """
  import AdventOfCode.Parsers.Satisfy
  import AdventOfCode.Parsers.Char

  def new_line, do: satisfy(char(), fn char -> char in [?\n] end)
end
