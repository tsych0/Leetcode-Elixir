# https://leetcode.com/problems/symmetric-tree/
defmodule Tree.IsSymmetric do
  @spec is_symmetric(root :: TreeNode.t() | nil) :: boolean
  def is_symmetric(nil), do: true

  def is_symmetric(root) do
    is_mirror_tree(root.left, root.right)
  end

  @spec is_mirror_tree(p :: TreeNode.t() | nil, q :: TreeNode.t() | nil) :: boolean
  def is_mirror_tree(p, q) do
    case {p, q} do
      {nil, nil} ->
        true

      {_, nil} ->
        false

      {nil, _} ->
        false

      {p, q} ->
        p.val == q.val and
          is_mirror_tree(p.left, q.right) and
          is_mirror_tree(p.right, q.left)
    end
  end
end
