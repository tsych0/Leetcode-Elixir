# https://leetcode.com/problems/construct-binary-tree-from-inorder-and-postorder-traversal/
defmodule Tree.BuildTreeInPost do
  @spec build_tree(inorder :: [integer], postorder :: [integer]) :: TreeNode.t() | nil
  def build_tree([], []), do: nil

  def build_tree(inorder, postorder) do
    postorder = postorder |> Enum.reverse()
    [head | postorder] = postorder
    postorder = postorder |> Enum.reverse()

    {left_inorder, [_ | right_inorder]} =
      inorder
      |> Enum.split_while(&(&1 != head))

    {left_postorder, right_postorder} = take_n_drop(postorder, length(left_inorder))

    %TreeNode{
      val: head,
      left: build_tree(left_inorder, left_postorder),
      right: build_tree(right_inorder, right_postorder)
    }
  end

  def take_n_drop(list, n, acc \\ [])

  def take_n_drop(list, 0, acc) do
    {acc |> Enum.reverse(), list}
  end

  def take_n_drop([head | tail], n, acc) do
    take_n_drop(tail, n - 1, [head | acc])
  end
end
