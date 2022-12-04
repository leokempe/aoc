defmodule Aoc2022 do
  def input(date) do
    File.read!("lib/days/" <> Integer.to_string(date) <> "/input.txt")
    |> String.split(~r{(\r\n|\r)})
  end

  def example_input(date) do
    File.read!("lib/days/" <> Integer.to_string(date) <> "/example_input.txt")
    |> String.split(~r{(\r\n|\r)})
  end
end
