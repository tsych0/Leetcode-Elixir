defmodule MajorityElement do
  @spec majority_element(nums :: [integer]) :: integer
  def majority_element(nums) do
    [head | tail] = nums
    majority_element(head, 1, tail)
  end

  defp majority_element(element, _count, []), do: element

  defp majority_element(element, count, _nums = [element | tail]) do
    majority_element(element, count + 1, tail)
  end

  defp majority_element(element, count, _nums = [head | tail]) do
    if count == 1 do
      majority_element(head, 1, tail)
    else
      majority_element(element, count - 1, tail)
    end
  end
end
