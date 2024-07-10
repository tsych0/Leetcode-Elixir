defmodule Leetcode do
  use Application

  def start(_type, _args) do
    main()
    Supervisor.start_link([], strategy: :one_for_one)
  end

  def main() do
    # nums = [2,7,11,15]
    # target = 9
    # IO.inspect(TwoSum.two_sum(nums, target))
    # IO.inspect(MajorityElement.majority_element([2,2,1,1,1,2,2]))
    # IO.inspect(MaxProfit.max_profit2([7,1,5,3,6,4]))
    # IO.inspect(JumpGame.jump([2, 3, 0, 1, 4]))
    # IO.inspect(HIndex.h_index([3,0,6,1,5]))
    IO.puts(NumTrees.num_trees(19))
  end
end
