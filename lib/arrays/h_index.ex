defmodule Arrays.HIndex do
  @spec h_index(citations :: [integer]) :: integer
  def h_index(citations) do
    n = length(citations)

    citations =
      citations
      |> Enum.map(fn x -> if x > n, do: n, else: x end)
      |> Enum.reduce(%{}, fn x, acc -> Map.put(acc, x, Map.get(acc, x, 0) + 1) end)

    h_index(citations |> Map.keys() |> Enum.sort(:desc), citations, 0, 0)
  end

  defp h_index([], _, _, max_h), do: max_h

  defp h_index(_citations = [head | tail], count, current_count, max_h) do
    current_count = current_count + count[head]

    if min(head, current_count) < max_h do
      max_h
    else
      h_index(tail, count, current_count, min(head, current_count))
    end
  end
end
