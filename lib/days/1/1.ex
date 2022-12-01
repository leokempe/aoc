defmodule Day1 do
  defp max([n]), do: n
  defp max([head | tail]) do
    Enum.reduce([head | tail], fn 
      n, acc when n >= acc -> n
      n, acc when n < acc -> acc
    end)
  end

  def solve() do
    Aoc2022.input(1)
    |> Enum.chunk_by(&(&1 === ""))
    |> Enum.filter(&(&1 !== [""]))
    |> Enum.map(&(Enum.sum(Enum.map(&1, fn x -> String.to_integer(x) end))))
    |> max
  end
end
