defmodule Day1 do
  def solve() do
    Aoc2022.input(1)
    |> Enum.chunk_by(&(&1 === ""))
    |> Enum.filter(&(&1 !== [""]))
    |> Enum.map(&(Enum.sum(Enum.map(&1, fn x -> String.to_integer(x) end))))
    |> Enum.max
  end
end
