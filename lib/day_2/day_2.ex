defmodule Day2 do

  @input [1,0,0,3,1,1,2,3,1,3,4,3,1,5,0,3,2,13,1,19,1,19,6,23,1,23,6,27,1,13,27,31,2,13,31,35,1,5,35,39,2,39,13,43,1,10,43,47,2,13,47,51,1,6,51,55,2,55,13,59,1,59,10,63,1,63,10,67,2,10,67,71,1,6,71,75,1,10,75,79,1,79,9,83,2,83,6,87,2,87,9,91,1,5,91,95,1,6,95,99,1,99,9,103,2,10,103,107,1,107,6,111,2,9,111,115,1,5,115,119,1,10,119,123,1,2,123,127,1,127,6,0,99,2,14,0,0]

  def part_1(input \\ @input, n \\ 12, v \\ 2) do
    input
    |> List.replace_at(1, n)
    |> List.replace_at(2, v)
    |> process_opcode
    |> List.first
  end

  def part_2(input \\ @input) do
    {n, v} = permute
    |> run_part_2(input)

    100 * n + v
  end

  defp run_part_2([{n, v} | t], input) do
    if part_1(input, n, v) == 19690720 do
      {n, v}
    else
      run_part_2(t, input)
    end
  end

  def process_opcode(codes) when is_list(codes), do: process_opcode({codes, 0})

  def process_opcode({codes, :halt}), do: codes

  def process_opcode({codes, pos}) do
    codes
    |> Enum.slice(pos, 4)
    |> run_operation(codes, pos)
    |> process_opcode
  end

  defp run_operation([99 | _], codes, _), do: {codes, :halt}

  defp run_operation([1, pos1, pos2, store_pos], codes, index) do
    var1 = Enum.at(codes, pos1)
    var2 = Enum.at(codes, pos2)
    {List.replace_at(codes, store_pos, var1 + var2), index + 4}
  end

  defp run_operation([2, pos1, pos2, store_pos], codes, index) do
    var1 = Enum.at(codes, pos1)
    var2 = Enum.at(codes, pos2)
    {List.replace_at(codes, store_pos, var1 * var2), index + 4}
  end

  defp permute do
    acc = []
    for n <- 0..99, v <- 0..99 do
      [{n, v} | acc]
    end
    |> List.flatten
  end
end

Day2.part_1 |> IO.inspect(label: "part 1")
Day2.part_2 |> IO.inspect(label: "part 2")
