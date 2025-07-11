# https://leetcode.com/problems/longest-increasing-path-in-a-matrix/
defmodule Graphs.LongestIncreasingPath do
  @moves [{0, 1}, {1, 0}, {-1, 0}, {0, -1}]

  @spec longest_increasing_path(matrix :: [[integer]]) :: integer
  def longest_increasing_path(matrix) do
    mat_map =
      matrix
      |> Enum.reduce({1, %{}}, fn line, {count, acc} ->
        line
        |> Enum.reduce({count, acc}, fn cell, {count, acc} ->
          {count + 1, Map.put(acc, count, cell)}
        end)
      end)
      |> elem(1)

    n = matrix |> length()
    m = matrix |> hd() |> length()

    1..n
    |> Enum.reduce(%{}, fn i, cache ->
      1..m
      |> Enum.reduce(cache, fn j, cache ->
        traverse([{i, j}], n, m, mat_map, cache)
      end)
    end)
    |> Map.values()
    |> Enum.max()
  end

  def traverse([], _, _, _, cache), do: cache

  def traverse(stack, n, m, mat_map, cache) do
    {stack, cache} = dfs(stack, n, m, mat_map, cache)
    traverse(stack, n, m, mat_map, cache)
  end

  def dfs([{i, j} | tail] = stack, n, m, mat_map, cache) do
    idx = index(i, j, m)

    if cache[idx] == nil do
      val = mat_map[idx]

      stack =
        @moves
        |> Enum.reduce(stack, fn {a, b}, stack ->
          x = i + a
          y = j + b

          if x > n or x < 1 or y > m or y < 1 or mat_map[index(x, y, m)] <= val or
               cache[index(x, y, m)] != nil do
            stack
          else
            [{x, y} | stack]
          end
        end)

      if hd(stack) == {i, j} do
        ans =
          @moves
          |> Enum.map(fn {a, b} ->
            x = i + a
            y = j + b

            if x > n or x < 1 or y > m or y < 1 or mat_map[index(x, y, m)] <= val do
              1
            else
              cache[index(x, y, m)] + 1
            end
          end)
          |> Enum.max()

        cache = cache |> Map.put(index(i, j, m), ans)

        {tail, cache}
      else
        {stack, cache}
      end
    else
      {tail, cache}
    end
  end

  def index(i, j, m) do
    (i - 1) * m + j
  end
end
