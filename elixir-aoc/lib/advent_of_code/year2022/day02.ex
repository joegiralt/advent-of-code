defmodule AdventOfCode.Year2022.Day02 do
  @moduledoc """
    A Day 02 Solution.
  """
  alias AdventOfCode.Year2022.Day02Parser

  def part_1() do
    Day02Parser.run()
    |> Enum.map(&create_hand_shapes/1)
    |> Enum.map(&eval_game/1)
    |> Enum.flat_map(&collect_scores/1)
    |> Enum.sum()
  end

  def part_2() do
    Day02Parser.run()
    |> Enum.map(&new_strategy/1)
    |> Enum.map(&eval_game/1)
    |> Enum.flat_map(&collect_scores/1)
    |> Enum.sum()
  end

  def create_hand_shapes([a, b]), do: {hand(a), hand(b)}

  def collect_scores({a, b}), do: [score_outcome(a), score_shape(b)]

  def new_strategy(hands) do
    case hands do
      # handles tie
      [a, "Y"] ->
        {hand(a), hand(a)}

      [b, "X"] ->
        {hand(b), b |> hand() |> find_loser()}

      [c, "Z"] ->
        {hand(c), c |> hand() |> find_winner()}
    end
  end

  def find_winner(shape) do
    case shape do
      :rock -> :paper
      :paper -> :scissors
      :scissors -> :rock
    end
  end

  def find_loser(shape) do
    case shape do
      :paper -> :rock
      :scissors -> :paper
      :rock -> :scissors
    end
  end

  def hand(letter) do
    case letter do
      "A" -> :rock
      "B" -> :paper
      "C" -> :scissors
      "X" -> :rock
      "Y" -> :paper
      "Z" -> :scissors
    end
  end

  def eval_game(game) do
    case game do
      {:paper, :rock} -> {:lose, :rock}
      {:scissors, :rock} -> {:win, :rock}
      {:rock, :scissors} -> {:lose, :scissors}
      {:paper, :scissors} -> {:win, :scissors}
      {:rock, :paper} -> {:win, :paper}
      {:scissors, :paper} -> {:lose, :paper}
      {a, a} -> {:tie, a}
    end
  end

  def score_outcome(outcome) do
    case outcome do
      :win -> 6
      :lose -> 0
      :tie -> 3
    end
  end

  def score_shape(shape) do
    case shape do
      :rock -> 1
      :paper -> 2
      :scissors -> 3
    end
  end
end
