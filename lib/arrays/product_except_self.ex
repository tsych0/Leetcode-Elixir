defmodule ProductExceptSelf do
  @spec product_except_self(nums :: [integer]) :: [integer]
  def product_except_self(nums) do
    nums |> product(1) |> elem(0)
  end

  defp product([], _), do: {[], 1}

  defp product([h | t], pred) do
    {res, suff} = product(t, h * pred)
    {[pred * suff | res], h * suff}
  end
end
