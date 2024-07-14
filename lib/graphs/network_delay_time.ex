# https://leetcode.com/problems/network-delay-time/
defmodule Graphs.NetworkDelayTime do
  @spec network_delay_time(times :: [[integer]], n :: integer, k :: integer) :: integer
  def network_delay_time(times, n, k) do
    graph =
      times
      |> Enum.reduce(%{}, fn [from, to, weight], g ->
        # Put the new edge into the adjacency list
        adj = [{to, weight} | g |> Map.get(from, [])]
        # Update the graph with the new adjacency list
        g |> Map.put(from, adj)
      end)

    distances = 1..n |> Enum.reduce(%{}, fn i, acc -> acc |> Map.put(i, :inf) end)
    distances = %{distances | k => 0}

    heap = Heap.new(&cmp/2) |> Heap.insert({0, k})

    distances = dfs(heap, distances, MapSet.new(), graph)

    max_time = distances |> Map.values() |> Enum.max()
    if max_time |> is_number(), do: max_time, else: -1
  end

  # The infamous dijstra
  def dfs(heap = %Heap{}, distances, visited, graph) do
    if heap.size == 0 do
      distances
    else
      {dist, node} = heap |> Heap.peek()
      heap = heap |> Heap.pop()

      if visited |> MapSet.member?(node) do
        # If already visited then nothing to do continue
        dfs(heap, distances, visited, graph)
      else
        visited = visited |> MapSet.put(node)

        {heap, distances} =
          graph
          |> Map.get(node, [])
          |> Enum.reduce({heap, distances}, fn {neighbor, cost}, {heap, distances} ->
            if cost + dist < distances[neighbor] do
              distances = %{distances | neighbor => cost + dist}
              heap = heap |> Heap.insert({distances[neighbor], neighbor})
              {heap, distances}
            else
              {heap, distances}
            end
          end)

        dfs(heap, distances, visited, graph)
      end
    end
  end

  def cmp({a, _}, {b, _}) do
    a < b
  end
end
