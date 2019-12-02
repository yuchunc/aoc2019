defmodule Day2Test do
  use ExUnit.Case, async: true

  describe "process_opcode/1" do
    test "[1,0,0,0,99] becomes [2,0,0,0,99] (1 + 1 = 2)." do
      input = [1, 0, 0, 0, 99]
      assert Day2.process_opcode(input) == [2,0,0,0,99]
    end

    test "[2, 3, 0, 3, 99] becomes [2,3,0,6,99] (3 * 2 = 6)." do
      input = [2, 3, 0, 3, 99]
      assert Day2.process_opcode(input) == [2,3,0,6,99]
    end

    test "[2, 4, 4, 5, 99, 0] becomes [2,4,4,5,99,9801] (99 * 99 = 9801)." do
      input = [2, 4, 4, 5, 99, 0]
      assert Day2.process_opcode(input) == [2,4,4,5,99,9801]
    end

    test "[1,1,1,4,99,5,6,0,99] becomes [30,1,1,4,2,5,6,0,99]" do
      input = [1,1,1,4,99,5,6,0,99]
      assert Day2.process_opcode(input) == [30,1,1,4,2,5,6,0,99]
    end
  end
end
