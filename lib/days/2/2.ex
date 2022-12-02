defmodule Day2 do
  @points %{rock: 1, paper: 2, scissors: 3, draw: 3, win: 6}

  defp input() do
    Aoc2022.input(2)
    |> Enum.filter(&(&1 !== ""))
    |> Enum.map(&(String.split(&1, " "))) 
  end

  def part_1() do
    input()
    |> Enum.map(&(Enum.map(&1, fn input ->
      case input do
        a when a === "A" or a === "X" -> :rock
        a when a === "B" or a === "Y" -> :paper
        a when a === "C" or a === "Z" -> :scissors
        _ -> :other
      end
    end)))
    |> Enum.map(&Enum.map(&1, fn input -> @points[input]end))
    |> Enum.map(fn input ->
      case input do
        [a, b] when a === b -> Enum.at(input, 1) + @points[:draw]
        [a, b] when a === b - 1 or (a === 3 and b === 1) -> Enum.at(input, 1) + @points[:win]
        _ -> Enum.at(input, 1)
      end
    end)
    |> Enum.sum()
  end

end
