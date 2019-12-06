defmodule Day1Test do
  use ExUnit.Case, async: true

  describe "calc_fuel/1" do
    test "For a mass of 12, divide by 3 and round down to get 4, then subtract 2 to get 2." do
      assert Day1.calc_fuel(12) == 2
    end

    test "For a mass of 14, dividing by 3 and rounding down still yields 4, so the fuel required is also 2." do
      assert Day1.calc_fuel(14) == 2
    end

    test "For a mass of 1969, the fuel required is 654." do
      assert Day1.calc_fuel(1969) == 654
    end

    test "For a mass of 100756, the fuel required is 33583." do
      assert Day1.calc_fuel(100_756) == 33583
    end
  end

  describe "deep_calc_fuel/1" do
    test "A module of mass 14 requires 2 fuel. This fuel requires no further fuel (2 divided by 3 and rounded down is 0, which would call for a negative fuel), so the total fuel required is still just 2." do
      assert Day1.deep_calc_fuel(14) == 2
    end

    test "The total fuel required for a module of mass 1969 is 654 + 216 + 70 + 21 + 5 = 966." do
      assert Day1.deep_calc_fuel(1969) == 966
    end

    test "The fuel required by a module of mass 100756 and its fuel is: 33583 + 11192 + 3728 + 1240 + 411 + 135 + 43 + 12 + 2 = 50346." do
      assert Day1.deep_calc_fuel(100_756) == 50346
    end
  end
end
