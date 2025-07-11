# https://leetcode.com/problems/unique-binary-search-trees-ii/
defmodule Tree.GenerateTrees do
  @spec generate_trees(n :: integer) :: [TreeNode.t() | nil]
  def generate_trees(n) do
    gen_trees(1, n)
  end

  def gen_trees(st, ed) when st > ed, do: [nil]

  def gen_trees(st, ed) do
    for i <- st..ed do
      left = gen_trees(st, i - 1)
      right = gen_trees(i + 1, ed)

      for l <- left, r <- right do
        %TreeNode{val: i, left: l, right: r}
      end
    end
    |> List.flatten()
  end
end
