defmodule AdventOfCode.Parsers.Char do
  @moduledoc """
    A Parser that identifies any UTF8 char
  """
  def char do
    fn input ->
      case input do
        "" -> {:error, "unexpected end of input"}
        <<char::utf8, rest::binary>> -> {:ok, char, rest}
      end
    end
  end
end
