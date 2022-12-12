defmodule Day1 do
  defp input do
    Aoc2022.input(1)
    |> Enum.chunk_by(&(&1 === ""))
    |> Enum.filter(&(&1 !== [""]))
    |> Enum.map(&Enum.sum(Enum.map(&1, fn x -> String.to_integer(x) end)))
  end

  def part_1() do
    input()
    |> Enum.max()
  end

  def part_2() do
    input()
    |> Enum.sort()
    |> Enum.take(-3)
    |> Enum.sum()
  end
end
