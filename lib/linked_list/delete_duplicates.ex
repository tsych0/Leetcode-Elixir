# https://leetcode.com/problems/remove-duplicates-from-sorted-list/
# https://leetcode.com/problems/remove-duplicates-from-sorted-list-ii/
defmodule DeleteDuplicates do
  @spec delete_duplicates(head :: ListNode.t() | nil) :: ListNode.t() | nil
  def delete_duplicates(%{val: val, next: next}) when next != nil do
    case next do
      %{val: ^val} -> delete_duplicates(next)
      next -> %ListNode{val: val, next: delete_duplicates(next)}
    end
  end

  def delete_duplicates(node), do: node

  @spec delete_duplicates2(head :: ListNode.t() | nil) :: ListNode.t() | nil
  def delete_duplicates2(head), do: delete_duplicates2(head, 101) |> elem(1)

  def delete_duplicates2(nil, _), do: {101, nil}

  def delete_duplicates2(%ListNode{val: v, next: n}, v),
    do: {v, delete_duplicates2(n, v) |> elem(1)}

  def delete_duplicates2(head, _) do
    {next_val, next} = delete_duplicates2(head.next, head.val)

    cond do
      next_val == head.val -> {head.val, next}
      true -> {head.val, %ListNode{head | next: next}}
    end
  end
end
