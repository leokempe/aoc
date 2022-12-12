defmodule Day8 do
  defp input() do
    Aoc2022.input(8)
    |> Enum.filter(& &1 !== "")
    |> Enum.map(&String.codepoints/1)
    |> Enum.map(&Enum.map(&1, fn n -> String.to_integer(n) end))
    |> Enum.map(&Enum.with_index/1)
    |> Enum.with_index()
  end

  defp get_blocking_trees(trees, tree_row, tree_idx) do
    tree_height = elem(Enum.at(elem(Enum.at(trees, tree_row), 0), tree_idx), 0)

    %{
      left:
        Enum.filter(elem(Enum.at(trees, tree_row), 0), fn {height, idx} ->
          idx < tree_idx and height >= tree_height
        end)
        |> Enum.sort_by(&elem(&1, 1)),
      right:
        Enum.filter(elem(Enum.at(trees, tree_row), 0), fn {height, idx} ->
          idx > tree_idx and height >= tree_height
        end)
        |> Enum.sort_by(&elem(&1, 1)),
      top:
        Enum.map(trees, fn {arr, row} ->
          blocking_trees = Enum.filter(arr, fn {height, idx} ->
            idx === tree_idx and row < tree_row and height >= tree_height
          end)

          if !Enum.empty?(blocking_trees),
            do: Enum.reduce(blocking_trees, [], fn {tree, _}, acc -> [{tree, row} | acc] end),
            else: []
        end)
        |> Enum.filter(& !Enum.empty?(&1))
        |> List.flatten()
        |> Enum.sort_by(&elem(&1, 1)),
      bottom:
        Enum.map(trees, fn {arr, row} ->
          blocking_trees = Enum.filter(arr, fn {height, idx} ->
            idx === tree_idx and row > tree_row and height >= tree_height
          end)

          if !Enum.empty?(blocking_trees),
            do: Enum.reduce(blocking_trees, [], fn {tree, _}, acc -> [{tree, row} | acc] end),
            else: []
        end)
        |> Enum.filter(& !Enum.empty?(&1))
        |> List.flatten()
        |> Enum.sort_by(&elem(&1, 1)),
    }
  end

  defp is_visible(trees, tree_row, tree_idx) do
    get_blocking_trees(trees, tree_row, tree_idx)
    |> Enum.reduce_while(false, fn {_, arr}, _ ->
        if Enum.empty?(arr), do: {:halt, true}, else: {:cont, false}
       end)
  end

  def part_1 do
    input = input()

    input
    |> Enum.reduce(0, fn {arr, row}, acc ->
      Enum.reduce(arr, 0, fn {_, idx}, row_acc ->
        if is_visible(input, row, idx), do: row_acc + 1, else: row_acc
      end) + acc
    end)
  end

  def part_2 do
    input = input()

    width = Enum.count(elem(Enum.at(input, 0), 0))
    height = Enum.count(input)

    input
    |> Enum.map(fn {arr, row} ->
      Enum.map(arr, fn {_, idx} ->
        get_blocking_trees(input, row, idx)
        |> Enum.reduce(1, fn {key, arr}, acc ->
          cond do
            Enum.empty?(arr) ->
              acc * case key do
                :left -> idx
                :right -> width - 1 - idx
                :top -> row
                :bottom -> height - 1 - row
              end
            true ->
              acc * case key do
                :left -> idx - elem(List.last(arr), 1)
                :right -> elem(List.first(arr), 1) - idx
                :top -> row - elem(List.last(arr), 1)
                :bottom -> elem(List.first(arr), 1) - row
              end
          end
        end)
      end)
      |> Enum.max()
    end)
    |> Enum.max()
  end
end
