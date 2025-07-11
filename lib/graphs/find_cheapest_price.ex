defmodule Graphs.FindCheapestPrice do
  @spec find_cheapest_price(
          n :: integer,
          flights :: [[integer]],
          src :: integer,
          dst :: integer,
          k :: integer
        ) :: integer
  def find_cheapest_price(n, flights, src, dst, k) do
    graph =
      flights
      |> Enum.reduce(%{}, fn [from, to, cost], g ->
        # Put the new edge into the adjacency list
        adj = [{to, cost} | g |> Map.get(from, [])]
        # Update the graph with the new adjacency list
        g |> Map.put(from, adj)
      end)
      |> IO.inspect()

    costs = 0..(n - 1) |> Enum.reduce(%{}, fn i, acc -> acc |> Map.put(i, :inf) end)
    costs = %{costs | src => 0}

    heap = Heap.new(&cmp/2) |> Heap.insert({0, 0, src})

    dfs(heap, costs, dst, k, graph)
  end

  def dfs(heap = %Heap{}, distances, dest, max_stops, graph) do
    IO.inspect(heap)

    if heap.size == 0 do
      -1
    else
      {dist, stop, node} = heap |> Heap.peek()
      heap = heap |> Heap.pop()
      IO.inspect("node = #{node}")

      if node == dest do
        dist
      else
        if stop > max_stops do
          # If already visited then nothing to do continue or consumed max stops
          dfs(heap, distances, dest, max_stops, graph)
        else
          {heap, distances} =
            graph
            |> Map.get(node, [])
            |> Enum.reduce({heap, distances}, fn {neighbor, cost}, {heap, distances} ->
              IO.inspect("node = #{node} neigh = #{neighbor}")
              heap = heap |> Heap.insert({cost + dist, stop + 1, neighbor})
              {heap, distances}
            end)

          dfs(heap, distances, dest, max_stops, graph)
        end
      end
    end
  end

  def cmp({a, _, _}, {b, _, _}) do
    a < b
  end
end
