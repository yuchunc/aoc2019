defmodule Day4 do
  @default_range 153_517..630_395

  def part1(range \\ @default_range) do
    range
    |> Enum.filter(&valid_pt1?/1)
    |> Enum.count()
  end

  def part2(range \\ @default_range) do
    range
    |> Enum.filter(&valid_pt2?/1)
    |> Enum.count()
  end

  def valid_pt1?(int) do
    digits = Integer.digits(int)
    increment?(digits) && has_dup?(digits)
  end

  def valid_pt2?(int) do
    digits = Integer.digits(int)
    increment?(digits) && valid_pt2_dup?(digits)
  end

  defp increment?([]), do: true
  defp increment?([d1 | [d2 | _]]) when d1 > d2, do: false
  defp increment?([_ | t]), do: increment?(t)

  defp has_dup?([]), do: false
  defp has_dup?([d1 | [d1 | _]]), do: true
  defp has_dup?([_ | t]), do: has_dup?(t)

  def valid_pt2_dup?(digits) do
    counts =
      digits
      |> Enum.chunk_by(& &1)
      |> Enum.map(&length/1)

    2 in counts
  end
end

Day4.part1() |> IO.inspect(label: "part 1")
Day4.part2() |> IO.inspect(label: "part 2")
