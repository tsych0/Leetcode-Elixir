defmodule Tree.SortedArrayToBst do
  @spec sorted_array_to_bst(nums :: [integer]) :: TreeNode.t() | nil
  def sorted_array_to_bst(nums) do
    size = length(nums)

    {left, [head | right]} = take_n_drop(nums, div(size, 2))

    %TreeNode{
      val: head,
      left: sorted_array_to_bst(left),
      right: sorted_array_to_bst(right)
    }
  end

  def take_n_drop(list, n, acc \\ [])

  def take_n_drop(list, 0, acc) do
    {acc |> Enum.reverse(), list}
  end

  def take_n_drop([head | tail], n, acc) do
    take_n_drop(tail, n - 1, [head | acc])
  end
end
