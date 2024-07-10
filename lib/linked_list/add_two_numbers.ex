# https://leetcode.com/problems/add-two-numbers/
defmodule AddTwoNumbers do
  @spec add_two_numbers(l1 :: ListNode.t() | nil, l2 :: ListNode.t() | nil) :: ListNode.t() | nil
  def add_two_numbers(l1, l2), do: add_two_numbers(l1, l2, false)

  # Earlier we were doing div and rem but it is costly operation while it is not required
  # instead we can just compare with 10 and subtract 10 because carry can only be one or zero

  defp add_two_numbers(l1, nil, false), do: l1
  defp add_two_numbers(nil, l2, false), do: l2
  defp add_two_numbers(nil, nil, true), do: %ListNode{val: 1, next: nil}

  defp add_two_numbers(l1, nil, c) do
    val = l1.val + if c, do: 1, else: 0

    cond do
      val > 9 ->
        %ListNode{
          val: val - 10,
          next: add_two_numbers(l1.next, nil, true)
        }

      true ->
        %ListNode{val: val, next: add_two_numbers(l1.next, nil, false)}
    end
  end

  defp add_two_numbers(nil, l2, c), do: add_two_numbers(l2, nil, c)

  defp add_two_numbers(l1, l2, c) do
    val = l1.val + l2.val + if c, do: 1, else: 0

    cond do
      val > 9 ->
        %ListNode{
          val: val - 10,
          next: add_two_numbers(l1.next, l2.next, true)
        }

      true ->
        %ListNode{
          val: val,
          next: add_two_numbers(l1.next, l2.next, false)
        }
    end
  end
end
