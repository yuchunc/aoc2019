defmodule Day4Test do
  use ExUnit.Case, async: true

  describe "valid_pt1?/1" do
    test "111111 is valid" do
      assert Day4.valid_pt1?(111_111) == true
    end

    test "223450 does not meet these criteria (decreasing pair of digits 50)." do
      assert Day4.valid_pt1?(223_450) == false
    end

    test "123789 does not meet these criteria (no double)." do
      assert Day4.valid_pt1?(123_789) == false
    end
  end

  describe "valid_pt2?/1" do
    test "112233 is valid" do
      assert Day4.valid_pt2?(112_233) == true
    end

    test "123444 is not valid" do
      assert Day4.valid_pt2?(123_444) == false
    end

    test "111122 is valid" do
      assert Day4.valid_pt2?(111_122) == true
    end
  end
end
