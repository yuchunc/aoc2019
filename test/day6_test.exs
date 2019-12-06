defmodule Day6Test do
  use ExUnit.Case, async: true

  describe "parse/1" do
    test "[A)B] returns list of objects with orbits" do
      assert Day6.parse(["A)B"]) == %{"A"=> nil, "B" => "A"}
    end

    test "['A)B', 'B)C'] returns list of objects with orbits" do
      input = ["A)B", "B)C"]
      assert Day6.parse(input) == %{"A"=> nil, "B" => "A", "C" => "B"}
    end

    test "['A)B', 'B)C', 'B)D'] returns list of objects with orbits" do
      input = ["A)B", "B)C", "B)D"]
      assert Day6.parse(input) == %{"A"=> nil, "B" => "A", "C" => "B", "D" => "B"}
    end

    test "['A)B', 'B)C', 'B)D', 'E)A'] returns list of objects with orbits" do
      input = ["A)B", "B)C", "B)D", "E)A"]
      assert Day6.parse(input) == %{"E" => nil, "A"=> "E", "B" => "A", "C" => "B", "D" => "B"}
    end
  end

  describe "part1/1" do
    test "[COM)B,B)C,C)D,D)E,E)F,B)G,G)H,D)I,E)J,J)K,K)L] returns 42" do
      input = ["COM)B","B)C","C)D","D)E","E)F","B)G","G)H","D)I","E)J","J)K","K)L"]
      assert Day6.part1(input) == 42
    end
  end

  describe "part2/1" do
    test "COM)B B)C C)D D)E E)F B)G G)H D)I E)J J)K K)L K)YOU I)SAN returns 4" do
      input = ["COM)B", "B)C", "C)D", "D)E", "E)F", "B)G", "G)H", "D)I", "E)J", "J)K", "K)L", "K)YOU", "I)SAN"]
      assert Day6.part2(input) == 4
    end
  end
end
