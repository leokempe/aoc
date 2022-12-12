defmodule Day3 do
  @items "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"

  defp input() do
    Aoc2022.input(3)
    |> Enum.filter(&(&1 !== ""))
  end

  def part_1 do
    input()
    |> Enum.map(fn string ->
      half = trunc(String.length(string) / 2)
      [String.slice(string, 0..half-1), String.slice(string, half..-1)]
    end)
    |> Enum.map(fn [head | tail] -> [String.codepoints(head) | tail] end)
    |> Enum.map(&(Enum.find(Enum.at(&1, 0), fn char ->
        String.contains?(Enum.at(&1, 1), char)
    end)))
    |> Enum.map(&(:binary.match(@items, &1)))
    |> Enum.map(&(elem(&1, 0) + 1))
    |> Enum.sum()
  end

  def part_2 do
    input()
    |> Enum.chunk_every(3)
    |> Enum.map(fn [head | tail] -> [String.codepoints(head) | tail] end)
    |> Enum.map(&(Enum.find(Enum.at(&1, 0), fn char ->
        String.contains?(Enum.at(&1, 1), char) and String.contains?(Enum.at(&1, 2), char)
    end)))
    |> Enum.map(&(:binary.match(@items, &1)))
    |> Enum.map(&(elem(&1, 0) + 1))
    |> Enum.sum()
  end
end
