# https://leetcode.com/problems/merge-k-sorted-lists/
defmodule LinkedList.MergeKLists do
  @spec merge_k_lists(lists :: [ListNode.t() | nil]) :: ListNode.t() | nil
  def merge_k_list([]), do: nil
  def merge_k_lists([node]), do: node

  def merge_k_lists(lists) do
    lists
    |> Enum.chunk_every(2)
    |> Enum.map(fn
      [l1, l2] -> LinkedList.MergeTwoLists.merge_two_lists(l1, l2)
      [l] -> l
    end)
    |> merge_k_lists()
  end
end
