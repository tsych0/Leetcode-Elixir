defmodule LinkedList.BuildFromArray do
  def build_list(lst) do
    lst |> Enum.reverse() |> build()
  end

  defp build([]), do: nil

  defp build([head | tail]) do
    %ListNode{val: head, next: build(tail)}
  end
end
