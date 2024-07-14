# https://leetcode.com/problems/evaluate-division/
defmodule Graphs.EvaluateDivision do
  @spec calc_equation(equations :: [[String.t()]], values :: [float], queries :: [[String.t()]]) ::
          [float]
  def calc_equation(equations, values, queries) do
    # Form graph using the equations as nodes and values as weight of the edge
    graph =
      Enum.zip(equations, values)
      |> Enum.reduce(%{}, fn {[a, b], val}, g ->
        g
        |> Map.put(
          a,
          g |> Map.get(a, %{}) |> Map.put(b, val)
        )
        |> Map.put(
          b,
          g |> Map.get(b, %{}) |> Map.put(a, 1 / val)
        )
      end)

    for [c, d] <- queries do
      if graph |> Map.has_key?(c) and graph |> Map.has_key?(d) do
        dfs([{c, 1}], d, MapSet.new(), graph)
      else
        -1.0
      end
    end
  end

  def dfs([], _, _, _), do: -1

  def dfs([{node, val} | rest], goal, visited, graph) do
    if node == goal do
      val
    else
      # Put the node into visited
      visited = visited |> MapSet.put(node)

      # Loop through neighbors and put the nodes in stack which are not visited
      stack =
        graph
        |> Map.get(node, [])
        |> Enum.reduce(rest, fn {neighbor, cost}, stack ->
          if visited |> MapSet.member?(neighbor) do
            stack
          else
            [{neighbor, val * cost} | stack]
          end
        end)

      dfs(stack, goal, visited, graph)
    end
  end
end
