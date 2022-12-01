defmodule Aoc2022 do
  def input(date) do
    File.read!("lib/days/" <> Integer.to_string(date) <> "/input.txt")
    |> String.split("\n")
  end
end
