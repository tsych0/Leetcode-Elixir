defmodule DSU do
  defstruct val: %{}

  def new(n) do
    val =
      1..n
      |> Enum.reduce(%{}, fn i, acc ->
        acc |> Map.put(i, -1)
      end)

    %DSU{val: val}
  end

  def union(set = %DSU{}, x, y) do
    %DSU{
      val: %{set.val | parent(set, x) => parent(set, y)}
    }
  end

  def parent(set = %DSU{}, x) do
    if set.val[x] == -1 do
      x
    else
      parent(set, set.val[x])
    end
  end
end
