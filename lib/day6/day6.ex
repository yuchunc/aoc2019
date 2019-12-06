defmodule Day6 do

  @default_path "lib/day6/input"

  def run, do: run(@default_path)

  def run(path) when is_binary(path) do
    input = load_input(path)
    part1(input) |> IO.inspect(label: "part 1")
    part2(input) |> IO.inspect(label: "part 2")
  end

  def part1(input) do
    input
    |> parse
    |> find_orbit
    |> Map.values
    |> Enum.map(&length/1)
    |> Enum.sum
  end

  def part2(input) do
    %{"SAN" => san_orbit, "YOU" => my_orbit} =  input
    |> parse
    |> find_orbit
    |> Map.take(["SAN", "YOU"])

    (san_orbit -- my_orbit) ++  (my_orbit -- san_orbit)
    |> length
  end

  def parse(orbit_list) do
    orbit_list
    |> Enum.reduce(%{}, &orbit_reducer/2)
  end

  defp orbit_reducer(orbit, acc) do
    [orbitee, orbiter] = orbit |> String.split(")")
    acc
    |> Map.put_new(orbitee, nil)
    |> Map.put(orbiter, orbitee)
  end

  defp find_orbit(orbits) do
    orbits
    |> Enum.into([])
    |> do_find_orbit(%{}, orbits)
  end

  defp do_find_orbit([], completed, _), do: completed

  defp do_find_orbit([{center, nil} | t], acc, orbits) do
    do_find_orbit(t, Map.put_new(acc, center, []), orbits)
  end

  defp do_find_orbit([{child, parent} | t], acc, orbits) do
    acc1 = case acc[parent] do
      parent_list when is_list(parent_list) -> Map.put_new(acc, child, [parent | parent_list])
      nil ->
        Map.put_new(acc, child, depth_search([parent], orbits))
    end

    do_find_orbit(t, acc1, orbits)
  end

  defp depth_search([h | _] = acc, orbits) do
    case orbits[h] do
      nil -> acc
      parent ->  depth_search([parent | acc], orbits)
    end
  end

  defp load_input(path) do
    path
    |> File.read!
    |> String.trim
    |> String.split("\n")
  end
end

Day6.run
