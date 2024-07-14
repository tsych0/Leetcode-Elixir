# https://leetcode.com/problems/minimum-height-trees/
defmodule Graphs.FindMinHeightTrees do
  @spec find_min_height_trees(n :: integer, edges :: [[integer]]) :: [integer]
  def find_min_height_trees(n, edges) do
    # Since we need to delete elements from graph
    # Using mapset drastically reduces the time taken
    # because list will take O(n) time to delete while MapSet will delete in O(1)
    graph =
      0..(n - 1)
      |> Enum.reduce(%{}, fn i, acc ->
        acc |> Map.put(i, MapSet.new())
      end)

    graph =
      edges
      |> Enum.reduce(graph, fn [a, b], acc ->
        acc
        |> Map.put(a, acc |> Map.get(a) |> MapSet.put(b))
        |> Map.put(b, acc |> Map.get(b) |> MapSet.put(a))
      end)

    leaves =
      graph
      |> Enum.filter(fn {_, edges} -> MapSet.size(edges) <= 1 end)

    remove_leaves(n, leaves, graph)
  end

  def remove_leaves(n, leaves, graph) do
    if n > 2 do
      n = n - length(leaves)

      {leaves, graph} =
        leaves
        |> Enum.reduce({[], graph}, fn {leaf, edges}, {acc, graph} ->
          [neighb] = edges |> MapSet.to_list()
          # Disconnect leaf from the graph
          graph = %{graph | leaf => []}
          # Remove the connection of the leaf from it's only neighbor
          graph = %{graph | neighb => graph[neighb] |> MapSet.delete(leaf)}
          # Now check if the neighbor has become a leaf or not
          acc = if MapSet.size(graph[neighb]) == 1, do: [{neighb, graph[neighb]} | acc], else: acc
          {acc, graph}
        end)

      remove_leaves(n, leaves, graph)
    else
      leaves |> Enum.map(&elem(&1, 0))
    end
  end
end
