# https://leetcode.com/problems/reverse-linked-list-ii/
defmodule LinkedList.ReverseBetween do
  @spec reverse_between(head :: ListNode.t() | nil, left :: integer, right :: integer) ::
          ListNode.t() | nil
  def reverse_between(head, 1, right) do
    head |> drop(right) |> reverse_list(head, right)
  end

  def reverse_between(head, 2, right) do
    %ListNode{
      head
      | next: head |> drop(right) |> reverse_list(head.next, right - 1)
    }
  end

  def reverse_between(head, left, right) do
    %ListNode{
      head
      | next: reverse_between(head.next, left - 1, right - 1)
    }
  end

  def reverse_list(acc, _, 0), do: acc

  def reverse_list(acc, list, k),
    do: reverse_list(%ListNode{list | next: acc}, list.next, k - 1)

  def drop(nil, _), do: nil
  def drop(head, 0), do: head
  def drop(head, n), do: drop(head.next, n - 1)

  def length(acc, nil), do: acc
  def length(acc, head), do: length(acc + 1, head.next)
end
