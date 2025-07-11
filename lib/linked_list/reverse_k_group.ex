# https://leetcode.com/problems/reverse-nodes-in-k-group/
defmodule LinkedList.ReverseKGroup do
  @spec reverse_k_group(head :: ListNode.t() | nil, k :: integer) :: ListNode.t() | nil
  def reverse_k_group(head, k) do
    cond do
      # if length is less then k then do not change it
      length(0, head) < k -> head
      true -> head |> drop(k) |> reverse_k_group(k) |> reverse_list(head, k)
    end
  end

  def reverse_list(acc, _, 0), do: acc

  def reverse_list(acc, list, k) do
    reverse_list(%ListNode{list | next: acc}, list.next, k - 1)
  end

  def drop(nil, _), do: nil
  def drop(head, 0), do: head
  def drop(head, n), do: drop(head.next, n - 1)

  def length(acc, nil), do: acc
  def length(acc, head), do: length(acc + 1, head.next)
end
