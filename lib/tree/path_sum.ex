# https://leetcode.com/problems/path-sum-ii/
defmodule Tree.PathSum do
  @spec path_sum(root :: TreeNode.t() | nil, target_sum :: integer) :: [[integer]]
  def path_sum(root, target_sum, acc \\ 0)
  def path_sum(nil, _, _), do: []

  def path_sum(root, target_sum, acc) do
    cond do
      root.left == nil and root.right == nil ->
        if root.val + acc == target_sum, do: [[root.val]], else: []

      true ->
        left_paths =
          path_sum(root.left, target_sum, acc + root.val)
          |> Enum.reduce([], fn x, acc -> [[root.val | x] | acc] end)

        path_sum(root.right, target_sum, acc + root.val)
        |> Enum.reduce(left_paths, fn x, acc -> [[root.val | x] | acc] end)
    end
  end
end
