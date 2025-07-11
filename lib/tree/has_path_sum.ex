# https://leetcode.com/problems/path-sum/
defmodule Tree.HasPathSum do
  @spec has_path_sum(root :: TreeNode.t() | nil, target_sum :: integer) :: boolean
  def has_path_sum(root, target_sum, acc \\ 0)
  def has_path_sum(nil, _, _), do: false

  def has_path_sum(root, target_sum, acc) do
    cond do
      root.left == nil and root.right == nil ->
        root.val + acc == target_sum

      true ->
        has_path_sum(root.left, target_sum, acc + root.val) or
          has_path_sum(root.right, target_sum, acc + root.val)
    end
  end
end
