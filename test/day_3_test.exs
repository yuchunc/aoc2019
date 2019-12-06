defmodule Day3Test do
  use ExUnit.Case, async: true

  describe "compute_intersects/2" do
    test "R75,D30,R83,U83,L12,D49,R71,U7,L72 and U62,R66,U55,R34,D71,R55,D58,R83 = [{155, 11}, {155, 4}, {146, 46}, {158, -12}]" do
      list_1 = "R75,D30,R83,U83,L12,D49,R71,U7,L72"
      list_2 = "U62,R66,U55,R34,D71,R55,D58,R83"

      assert Day3.compute_intersects(list_1, list_2) == [
               {158, -12},
               {146, 46},
               {155, 4},
               {155, 11}
             ]
    end

    test "R98,U47,R26,D63,R33,U87,L62,D20,R33,U53,R51 and U98,R91,D20,R16,D67,R40,U7,R15,U6,R7 = [{107, 51}, {107, 71}, {157, 18}, {124, 11}, {107, 47}]" do
      list_1 = "R98,U47,R26,D63,R33,U87,L62,D20,R33,U53,R51"
      list_2 = "U98,R91,D20,R16,D67,R40,U7,R15,U6,R7"

      assert Day3.compute_intersects(list_1, list_2) == [
               {107, 47},
               {124, 11},
               {157, 18},
               {107, 71},
               {107, 51}
             ]
    end
  end

  describe "part 2 test" do
    test "R75,D30,R83,U83,L12,D49,R71,U7,L72 and U62,R66,U55,R34,D71,R55,D58,R83 = 610 steps" do
      list1 = "R75,D30,R83,U83,L12,D49,R71,U7,L72"
      list2 = "U62,R66,U55,R34,D71,R55,D58,R83"
      assert Day3.part2(list1, list2) == 610
    end

    test "R98,U47,R26,D63,R33,U87,L62,D20,R33,U53,R51 and U98,R91,D20,R16,D67,R40,U7,R15,U6,R7 = 410 steps" do
      list1 = "R98,U47,R26,D63,R33,U87,L62,D20,R33,U53,R51"
      list2 = "U98,R91,D20,R16,D67,R40,U7,R15,U6,R7"

      assert Day3.part2(list1, list2) == 410
    end
  end
end
