# https://leetcode.com/problems/binary-tree-inorder-traversal/
defmodule Tree.InorderTraversal do
  @spec inorder_traversal(root :: TreeNode.t() | nil) :: [integer]
  def inorder_traversal(root) do
    inorder_traversal(root, []) |> Enum.reverse()
  end

  def inorder_traversal(nil, acc), do: acc

  def inorder_traversal(root, acc) do
    # root comes in between in inorder traversal
    acc = inorder_traversal(root.left, acc)
    acc = [root.val | acc]
    inorder_traversal(root.right, acc)
  end
end
