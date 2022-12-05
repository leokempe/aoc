defmodule Day5 do
  defp input() do
    input = Aoc2022.input(5)
    |> Enum.chunk_by(& &1 !== "")
    |> Enum.filter(& &1 !== [""])

    stack_data = List.first(input)
    |> Enum.map(& String.codepoints(&1))
    |> Enum.map(& Enum.with_index(&1))
    |> Enum.map(&Enum.filter(&1, fn {char, _} -> !Regex.match?(~r/ |\[|\]/, char) end))

    stack_id_map = List.last(stack_data)
    |> Enum.map(fn {first, second} -> {second, String.to_integer(first)} end)
    |> Map.new()

    stacks = Enum.reduce(Enum.reverse(Enum.slice(stack_data, 0..-2)),  %{},
      &Enum.reduce(&1, &2, fn {crate, idx}, acc ->
        new_acc = Map.put_new(acc, stack_id_map[idx], [])
        Map.put(new_acc, stack_id_map[idx], new_acc[stack_id_map[idx]] ++ [crate])
      end)
    )

    instructions = List.last(input)
    |> Enum.map(&Enum.filter(String.split(&1), fn char -> Regex.match?(~r/[0-9]/, char) end))
    |> Enum.map(fn [count, from, to] -> %{count: String.to_integer(count), from: String.to_integer(from), to: String.to_integer(to)} end)

    %{stacks: stacks, instructions: instructions}
  end

  def part_1 do
    input = input()

    Enum.reduce(input[:instructions], input[:stacks], fn %{count: count, from: from, to: to}, acc ->
      acc1 = Map.put(acc, to, (acc[to] ++ Enum.reverse(Enum.slice(acc[from], -(count)..-1))))
      Map.put(acc1, from, Enum.slice(acc1[from], 0..-(count + 1)))
    end)
    |> Enum.map(fn {_, stack} -> List.last(stack) end)
    |> Enum.join()
  end

  def part_2 do
    input = input()

    Enum.reduce(input[:instructions], input[:stacks], fn %{count: count, from: from, to: to}, acc ->
      acc1 = Map.put(acc, to, (acc[to] ++ Enum.slice(acc[from], -(count)..-1)))
      Map.put(acc1, from, Enum.slice(acc1[from], 0..-(count + 1)))
    end)
    |> Enum.map(fn {_, stack} -> List.last(stack) end)
    |> Enum.join()
  end
end
