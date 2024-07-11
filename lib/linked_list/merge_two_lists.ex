# https://leetcode.com/problems/merge-two-sorted-lists/
defmodule LinkedList.MergeTwoLists do
  @spec merge_two_lists(list1 :: ListNode.t() | nil, list2 :: ListNode.t() | nil) ::
          ListNode.t() | nil
  def merge_two_lists(list1, list2) do
    merge_(list1, list2)
  end

  def merge_(list1, nil), do: list1
  def merge_(nil, list2), do: list2

  def merge_(list1, list2) do
    # select the smaller value
    if list1.val < list2.val do
      %ListNode{list1 | next: merge_(list1.next, list2)}
    else
      %ListNode{list2 | next: merge_(list1, list2.next)}
    end
  end
end
