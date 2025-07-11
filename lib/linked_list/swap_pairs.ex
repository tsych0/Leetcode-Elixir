# https://leetcode.com/problems/swap-nodes-in-pairs/
defmodule LinkedList.SwapPairs do
  @spec swap_pairs(head :: ListNode.t() | nil) :: ListNode.t() | nil
  def swap_pairs(nil), do: nil
  def swap_pairs(head), do: swap_pairs(head, head.next)

  def swap_pairs(head, nil), do: head

  def swap_pairs(first, second) do
    %ListNode{
      second
      | next: %ListNode{
          first
          | next:
              unless second.next == nil do
                swap_pairs(second.next, second.next.next)
              else
                nil
              end
        }
    }
  end
end
