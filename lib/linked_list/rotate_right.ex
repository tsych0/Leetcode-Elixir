# https://leetcode.com/problems/rotate-list/
defmodule LinkedList.RotateRight do
  @spec rotate_right(head :: ListNode.t() | nil, k :: integer) :: ListNode.t() | nil
  def rotate_right(nil, _), do: nil

  def rotate_right(head, k) do
    {front, back} = split(head, drop(head, rem(k, length(0, head))))
    join(back, front)
  end

  def join(nil, back), do: back

  def join(front, back) do
    case front.next do
      nil -> %ListNode{front | next: back}
      next -> %ListNode{front | next: join(next, back)}
    end
  end

  def split(back, front) do
    case front.next do
      nil ->
        {%ListNode{back | next: nil}, back.next}

      _ ->
        {head, rest} = split(back.next, front.next)
        {%ListNode{back | next: head}, rest}
    end
  end

  def drop(nil, _), do: nil
  def drop(head, 0), do: head
  def drop(head, n), do: drop(head.next, n - 1)

  def length(acc, nil), do: acc
  def length(acc, head), do: length(acc + 1, head.next)
end
