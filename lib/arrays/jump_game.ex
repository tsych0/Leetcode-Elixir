defmodule JumpGame do
  @spec can_jump(nums :: [integer]) :: boolean
  def can_jump(nums) do
    # time complexity of both are same
    can_jump?(nums, 1)
    # or have the one line solution
    nums |> Enum.reduce(1, fn x, acc -> if acc > 0, do: max(acc - 1, x), else: -1 end) >= 0
  end

  defp can_jump?([], points), do: points >= 0
  defp can_jump?(_, points) when points < 0, do: false

  defp can_jump?(_nums = [head | tail], points) when points > 0 do
    can_jump?(tail, max(points - 1, head))
  end

  @spec jump(nums :: [integer]) :: integer
  def jump(nums) do
    jumps(nums |> Enum.reverse() |> tl, [0])
  end

  defp jumps([], num_jumps), do: hd(num_jumps)

  defp jumps(_nums = [tail | head], num_jumps) do
    jumps(head, [(num_jumps |> Enum.take(tail) |> Enum.min(fn -> 100_000 end)) + 1 | num_jumps])
  end
end
