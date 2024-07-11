# https://leetcode.com/problems/validate-binary-search-tree/
defmodule Tree.IsValidBst do
  @spec is_valid_bst(root :: TreeNode.t() | nil) :: boolean
  def is_valid_bst(root) do
    root |> inorder_check() |> is_list()
  end

  @spec inorder_check(root :: TreeNode.t() | nil) :: [integer] | :invalid
  def inorder_check(root) do
    inorder_check(root, [])
  end

  def inorder_check(nil, acc), do: acc

  def inorder_check(root, acc) do
    # root comes in between in inorder traversal
    case inorder_check(root.left, acc) do
      [x | _] = acc ->
        if x >= root.val do
          :invalid
        else
          acc = [root.val | acc]
          inorder_check(root.right, acc)
        end

      [] ->
        acc = [root.val | acc]
        inorder_check(root.right, acc)

      _ ->
        :invalid
    end
  end
end
