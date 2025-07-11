# https://leetcode.com/problems/partition-list/
defmodule LinkedList.Partition do
  @spec partition(head :: ListNode.t() | nil, x :: integer) :: ListNode.t() | nil
  def partition(head, x) do
    partition_([], [], head, x)
  end

  def partition_(acc1, acc2, %ListNode{val: v, next: n}, x) do
    cond do
      v < x -> partition_([v | acc1], acc2, n, x)
      true -> partition_(acc1, [v | acc2], n, x)
    end
  end

  def partition_(acc1, acc2, nil, _) do
    greater = acc2 |> Enum.reduce(nil, fn x, acc -> %ListNode{val: x, next: acc} end)
    acc1 |> Enum.reduce(greater, fn x, acc -> %ListNode{val: x, next: acc} end)
  end
end
