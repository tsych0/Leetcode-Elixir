# https://leetcode.com/problems/minimum-depth-of-binary-tree/
defmodule Tree.MinDepth do
  @spec min_depth(root :: TreeNode.t() | nil) :: integer
  def min_depth(nil), do: 0

  def min_depth(root) do
    left = min_depth(root.left)
    right = min_depth(root.right)

    cond do
      left == 0 -> right
      right == 0 -> left
      true -> min(left, right)
    end + 1
  end
end
