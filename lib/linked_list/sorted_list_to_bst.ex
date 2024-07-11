# https://leetcode.com/problems/convert-sorted-list-to-binary-search-tree/
defmodule LinkedList.SortedListToBst do
  @spec sorted_list_to_bst(head :: ListNode.t() | nil) :: TreeNode.t() | nil
  def sorted_list_to_bst(head) do
    n = length_ll(head)
    list_to_bst(head, n) |> elem(0)
  end

  def list_to_bst(node, 0), do: {nil, node}

  def list_to_bst(head, n) do
    {left, mid} = list_to_bst(head, div(n, 2))
    {right, rem} = list_to_bst(mid.next, div(n - 1, 2))

    parent = %TreeNode{
      val: mid.val,
      left: left,
      right: right
    }

    {parent, rem}
  end

  def length_ll(head, acc \\ 0)
  def length_ll(nil, acc), do: acc
  def length_ll(head, acc), do: length_ll(head.next, acc + 1)
end
