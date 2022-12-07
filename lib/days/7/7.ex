defmodule Day7 do
  defp input() do
    Aoc2022.input(7)
    |> Enum.reduce({"", %{}}, fn line, {curr_dir, dir_map} ->
      cond do
        String.starts_with?(line, "$ cd") ->
          dir = List.last(String.split(line, " "))
          cond do
            dir === ".." ->
              temp_dir = Enum.join(Enum.slice(String.split(curr_dir, "/"), 0..-3), "/")
              {(if temp_dir === "", do: "/", else: temp_dir <> "/"), dir_map}
            dir === "/" ->
              {dir, Map.put_new(dir_map, dir, 0)}
            true ->
              {curr_dir <> dir <> "/", Map.put_new(dir_map, curr_dir <> dir <> "/", 0)}
          end
        String.starts_with?(line, ["1", "2", "3", "4", "5", "6", "7", "8", "9"]) ->
          new_size = String.to_integer(List.first(String.split(line, " ")))
          {curr_dir, Map.new(Enum.map(dir_map, fn {dir, size} ->
            cond do
              String.contains?(curr_dir, dir) -> {dir, size + new_size}
              true -> {dir, size}
            end
          end))}
        true -> {curr_dir, dir_map}
      end
    end)
    |> elem(1)
  end

  def part_1 do
    input()
    |> Map.filter(fn {_, size} -> size <= 100000 end)
    |> Enum.map(fn {_, size} -> size end)
    |> Enum.sum()
  end

  def part_2 do
    input = input()

    required_space = 30000000 - (70000000 - input["/"])

    input
    |> Enum.map(fn {_, size} -> size end)
    |> Enum.filter(& &1 >= required_space)
    |> Enum.sort()
    |> List.first()
  end
end
