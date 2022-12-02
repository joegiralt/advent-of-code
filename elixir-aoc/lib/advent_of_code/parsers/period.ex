defmodule AdventOfCode.Parsers.Period do
  @moduledoc """
    A Parser that checks if a character is a period
  """
  import AdventOfCode.Parsers.Char
  import AdventOfCode.Parsers.Satisfy

  def period, do: satisfy(char(), fn char -> char in [?.] end)
end
