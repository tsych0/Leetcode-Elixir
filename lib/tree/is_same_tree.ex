# https://leetcode.com/problems/same-tree/
defmodule Tree.IsSameTree do
  @spec is_same_tree(p :: TreeNode.t() | nil, q :: TreeNode.t() | nil) :: boolean
  def is_same_tree(p, q) do
    case {p, q} do
      {nil, nil} ->
        true

      {_, nil} ->
        false

      {nil, _} ->
        false

      {p, q} ->
        p.val == q.val and
          is_same_tree(p.left, q.left) and
          is_same_tree(p.right, q.right)
    end
  end
end
