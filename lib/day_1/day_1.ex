defmodule Day1 do

  @input_file "lib/day_1/input.txt"

  def part1(input_path \\ @input_file) do
    input_path
    |> load_input
    |> Enum.reduce(0, fn(elem, acc) ->
      elem |> String.to_integer |> calc_fuel |> Kernel.+(acc)
    end)
  end

  def part2(input_path \\ @input_file) do
    input_path
    |> load_input
    |> Enum.reduce(0, fn(elem, acc) ->
      elem |> String.to_integer |> deep_calc_fuel |> Kernel.+(acc)
    end)
  end

  def load_input(input_path) do
    input_path
    |> File.read!
    |> String.trim
    |> String.split("\n")
  end

  def calc_fuel(mass) do
    mass / 3 - 2
    |> trunc()
  end

  def deep_calc_fuel(mass) do
    fuel_needed = calc_fuel(mass)
    deep_calc_fuel(fuel_needed, 0)
  end

  def deep_calc_fuel(mass, acc) when mass <= 0, do: acc

  def deep_calc_fuel(mass, acc) do
    fuel_needed = calc_fuel(mass)
    deep_calc_fuel(fuel_needed, acc + mass)
  end
end

Day1.part1()
|> IO.inspect(label: "part 1")

Day1.part2()
|> IO.inspect(label: "part 2")
