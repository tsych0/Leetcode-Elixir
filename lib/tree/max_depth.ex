# https://leetcode.com/problems/maximum-depth-of-binary-tree/
defmodule Tree.MaxDepth do
  @spec max_depth(root :: TreeNode.t() | nil) :: integer
  def max_depth(nil), do: 0

  def max_depth(root) do
    max(max_depth(root.left), max_depth(root.right)) + 1
  end
end
