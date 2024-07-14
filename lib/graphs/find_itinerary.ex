# https://leetcode.com/problems/reconstruct-itinerary/
defmodule Graphs.FindItinerary do
  @spec find_itinerary(tickets :: [[String.t()]]) :: [String.t()]
  def find_itinerary(tickets) do
    graph =
      tickets
      |> Enum.sort(:desc)
      |> Enum.reduce(%{}, fn [from, to], g ->
        g |> Map.put(from, [to | Map.get(g, from, [])])
      end)

    dfs(["JFK"], graph, [])
  end

  def dfs([], _, acc), do: acc

  def dfs([top | rest] = stack, graph, acc) do
    case graph |> Map.get(top, []) do
      [] ->
        # We touched the dead end so put it into the result
        acc = [top | acc]
        graph = graph |> Map.put(top, [])
        dfs(rest, graph, acc)

      [head | tail] ->
        # Otherwise visit all the paths by pushing into the stack
        graph = graph |> Map.put(top, tail)
        stack = [head | stack]
        dfs(stack, graph, acc)
    end
  end
end
