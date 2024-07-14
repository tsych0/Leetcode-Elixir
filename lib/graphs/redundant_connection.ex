# https://leetcode.com/problems/redundant-connection/
defmodule Graphs.RedundantConnection do
  @spec find_redundant_connection(edges :: [[integer]]) :: [integer]
  def find_redundant_connection(edges) do
    edges
    |> Enum.reduce_while(DSU.new(length(edges)), fn [a, b], dsu ->
      if DSU.parent(dsu, a) != DSU.parent(dsu, b) do
        {:cont, dsu |> DSU.union(a, b)}
      else
        {:halt, [a, b]}
      end
    end)
  end
end
