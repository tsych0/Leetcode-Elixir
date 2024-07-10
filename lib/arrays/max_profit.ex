defmodule MaxProfit do
  @spec max_profit(prices :: [integer]) :: integer
  def max_profit(prices) do
    max_profit(prices, hd(prices), 0)
  end

  defp max_profit([], _min_seen, max_profit), do: max_profit

  defp max_profit(_prices = [head | tail], min_seen, max_profit) do
    max_profit(tail, min(min_seen, head), max(max_profit, head - min_seen))
  end

  @spec max_profit2(prices :: [integer]) :: integer
  def max_profit2(prices) do
    max_profit2(prices, hd(prices), 0)
  end

  defp max_profit2([], _min_seen, total_profit), do: total_profit

  defp max_profit2(_prices = [head | tail], min_seen, total_profit) do
    if head > min_seen do
      max_profit2(tail, head, total_profit + head - min_seen)
    else
      max_profit2(tail, head, total_profit)
    end
  end
end
