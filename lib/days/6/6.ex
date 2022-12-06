defmodule Day6 do
  defp input() do
    List.first(Aoc2022.input(6))
    |> String.codepoints()
    |> Enum.with_index()
  end

  defp characters_until_uniq(list) do
    Enum.reduce_while(list, [], fn set, acc ->
      if length(Enum.uniq_by(set, fn {char, _} -> char end)) !== length(set), do: {:cont, [set | acc]}, else: {:halt, elem(List.last(set), 1) + 1}
    end)
  end

  def part_1 do
    input()
    |> Enum.chunk_every(4, 1)
    |> characters_until_uniq()
  end

  def part_2 do
    input()
    |> Enum.chunk_every(14, 1)
    |> characters_until_uniq()
  end
end
