# https://leetcode.com/problems/unique-binary-search-trees/
defmodule Tree.NumTrees do
  @spec num_trees(n :: integer) :: integer
  def num_trees(n) do
    dp = %{0 => 1, 1 => 1}
    1..n |> Enum.reduce(dp, &count_trees/2) |> Map.get(n)
  end

  def count_trees(n, dp) do
    ans =
      for i <- 1..n do
        dp[i - 1] * dp[n - i]
      end
      |> Enum.sum()

    Map.put(dp, n, ans)
  end
end
