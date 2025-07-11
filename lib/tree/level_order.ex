# https://leetcode.com/problems/binary-tree-level-order-traversal/
# https://leetcode.com/problems/binary-tree-level-order-traversal-ii/
defmodule Tree.LevelOrder do
  @spec level_order(root :: TreeNode.t() | nil) :: [[integer]]
  def level_order(nil), do: []

  def level_order(root) do
    # Basically we need to do the breadth first traversal
    level_traverse([root], [])
    |> Enum.reverse()
  end

  def level_traverse([], acc), do: acc

  def level_traverse(level, acc) do
    {level_data, next_level} = traverse(level)

    next_level
    |> Enum.reverse()
    |> level_traverse([level_data | acc])
  end

  def traverse(level) do
    level
    |> Enum.reduce({[], []}, fn
      nil, {values, childs} ->
        {values, childs}

      node, {values, childs} ->
        childs = if node.right != nil, do: [node.right | childs], else: childs
        childs = if node.left != nil, do: [node.left | childs], else: childs
        {[node.val | values], childs}
    end)
  end
end
