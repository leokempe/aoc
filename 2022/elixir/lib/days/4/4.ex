defmodule Day4 do
  defp input() do
    Aoc2022.input(4)
    |> Enum.filter(&(&1 !== ""))
    |> Enum.map(&String.split(&1, ~r{(-|,)}))
    |> Enum.map(&Enum.map(&1, fn str -> String.to_integer(str) end))
  end

  def part_1 do
    input()
    |> Enum.filter(fn [first, second, third, fourth] ->
      (first <= third and second >= fourth) or
        (first >= third and second <= fourth)
    end)
    |> Enum.count()
  end

  def part_2 do
    input()
    |> Enum.filter(fn [first, second, third, fourth] ->
      (first >= third and first <= fourth) or
        (second <= fourth and second >= third) or
        (third >= first and third <= second) or
        (fourth <= second and fourth >= first)
    end)
    |> Enum.count()
  end
end
