defmodule AdventOfCode.Parsers.Choice do
  @moduledoc """
    A Parser that chooses between two, `OR`
  """

  def choice(parsers) do
    fn input ->
      case parsers do
        [] ->
          {:error, "No parsers suceeded"}

        [first_parser | other_parsers] ->
          with {:error, _reason} <- first_parser.(input),
               do: choice(other_parsers).(input)
      end
    end
  end
end
