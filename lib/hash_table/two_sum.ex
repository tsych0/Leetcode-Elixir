# https://leetcode.com/problems/two-sum/
defmodule TwoSum do
  @spec two_sum(nums :: [integer], target :: integer) :: [integer]
  def two_sum(nums, target) do
    two_sum(0, nums, %{}, target)
  end

  defp two_sum(_idx, [], _seen, _target), do: []

  defp two_sum(idx, [head | tail], seen, target) do
    case Map.fetch(seen, target - head) do
      {:ok, other_idx} -> [idx, other_idx]
      :error -> two_sum(idx + 1, tail, Map.put(seen, head, idx), target)
    end
  end
end
