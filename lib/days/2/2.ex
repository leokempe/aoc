defmodule Day2 do
  @points %{rock: 1, paper: 2, scissors: 3, lose: 0, draw: 3, win: 6}

  defp input() do
    Aoc2022.input(2)
    |> Enum.filter(&(&1 !== ""))
    |> Enum.map(&String.split(&1, " "))
  end

  def part_1() do
    input()
    |> Enum.map(fn
      ["A", "X"] -> @points[:rock] + @points[:draw]
      ["A", "Y"] -> @points[:paper] + @points[:win]
      ["A", "Z"] -> @points[:scissors]
      ["B", "X"] -> @points[:rock]
      ["B", "Y"] -> @points[:paper] + @points[:draw]
      ["B", "Z"] -> @points[:scissors] + @points[:win]
      ["C", "X"] -> @points[:rock] + @points[:win]
      ["C", "Y"] -> @points[:paper]
      ["C", "Z"] -> @points[:scissors] + @points[:draw]
      _ -> :error
    end)
    |> Enum.sum()
  end

  def part_2() do
    input()
    |> Enum.map(fn
      ["A", "X"] -> @points[:scissors]
      ["A", "Y"] -> @points[:rock] + @points[:draw]
      ["A", "Z"] -> @points[:paper] + @points[:win]
      ["B", "X"] -> @points[:rock]
      ["B", "Y"] -> @points[:paper] + @points[:draw]
      ["B", "Z"] -> @points[:scissors] + @points[:win]
      ["C", "X"] -> @points[:paper]
      ["C", "Y"] -> @points[:scissors] + @points[:draw]
      ["C", "Z"] -> @points[:rock] + @points[:win]
      _ -> :error
    end)
    |> Enum.sum()
  end
end
