defmodule Day3 do
  @input_path "lib/day_3/input"

  def part1(path \\ @input_path) do
    [list1, list2, _] =
      path
      |> File.read!()
      |> String.split("\n")

    compute_intersects(list1, list2)
    |> Enum.map(fn {x, y} ->
      abs(x) + abs(y)
    end)
    |> Enum.min()
  end

  def part2(path \\ @input_path) do
    [list1, list2, _] =
      path
      |> File.read!()
      |> String.split("\n")

    part2(list1, list2)
  end

  def part2(str_list1, str_list2) do
    wire1 = gen_wire(str_list1, {0, 0})
    wire2 = gen_wire(str_list2, {0, 0})

    compute_intersects(wire1, wire2)
    |> Enum.map(fn elem ->
      Enum.find_index(wire1, &(&1 == elem)) + Enum.find_index(wire2, &(&1 == elem))
    end)
    |> Enum.min()
  end

  def compute_intersects(str1, str2) when is_binary(str1) and is_binary(str2),
    do: compute_intersects({0, 0}, str1, str2)

  def compute_intersects(wire1, wire2) do
    (wire1 -- wire1 -- wire2)
    |> Enum.reject(&(&1 == {0, 0}))
  end

  def compute_intersects(init_pos, str1, str2) do
    wire1 = gen_wire(str1, init_pos)
    wire2 = gen_wire(str2, init_pos)

    compute_intersects(wire1, wire2)
  end

  defp gen_wire(str_list, init_pos) do
    str_list
    |> String.split(",")
    |> Enum.reduce([init_pos], &transcribe/2)
    |> Enum.reverse()
  end

  defp transcribe("U" <> count, [{x, y} | _] = acc) do
    (y + 1)..(y + String.to_integer(count))
    |> Enum.reduce(acc, &[{x, &1} | &2])
  end

  defp transcribe("D" <> count, [{x, y} | _] = acc) do
    (y - String.to_integer(count))..(y - 1)
    |> Enum.into([])
    |> Enum.reverse()
    |> Enum.reduce(acc, &[{x, &1} | &2])
  end

  defp transcribe("R" <> count, [{x, y} | _] = acc) do
    (x + 1)..(x + String.to_integer(count))
    |> Enum.reduce(acc, &[{&1, y} | &2])
  end

  defp transcribe("L" <> count, [{x, y} | _] = acc) do
    (x - String.to_integer(count))..(x - 1)
    |> Enum.into([])
    |> Enum.reverse()
    |> Enum.reduce(acc, &[{&1, y} | &2])
  end
end

Day3.part1()
|> IO.inspect(label: "part 1")

Day3.part2()
|> IO.inspect(label: "part 2")
