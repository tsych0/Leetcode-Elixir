# https://leetcode.com/problems/remove-nth-node-from-end-of-list/
defmodule LinkedList.RemoveNthFromEnd do
  @spec remove_nth_from_end(head :: ListNode.t() | nil, n :: integer) :: ListNode.t() | nil
  def remove_nth_from_end(head, n) do
    front = drop(head, n)

    case front do
      # Remove the first node
      nil -> head.next
      # Front starts from front.next
      _ -> remove_(head, front.next)
    end
  end

  def remove_(nil, _), do: nil

  def remove_(back, nil) do
    cond do
      back.next != nil -> %ListNode{back | next: back.next.next}
      true -> %ListNode{back | next: nil}
    end
  end

  def remove_(back, front) do
    %ListNode{back | next: remove_(back.next, front.next)}
  end

  def drop(nil, _), do: nil
  def drop(head, 0), do: head
  def drop(head, n), do: drop(head.next, n - 1)
end
