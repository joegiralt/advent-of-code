defmodule AdventOfCode.Parsers.SeperatedList do
  import AdventOfCode.Parsers.Many
  import AdventOfCode.Parsers.Map
  import AdventOfCode.Parsers.Sequence

  def separated_list(element_parser, separator_parser) do
    sequence([
      element_parser,
      many(sequence([separator_parser, element_parser]))
    ])
    |> map(fn [first_element, rest] ->
      other_elements = Enum.map(rest, fn [_, element] -> element end)
      [first_element | other_elements]
    end)
  end
end
