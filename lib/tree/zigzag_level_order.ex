# https://leetcode.com/problems/binary-tree-zigzag-level-order-traversal/
defmodule ZigzagLevelOrder do
  @spec zigzag_level_order(root :: TreeNode.t() | nil) :: [[integer]]
  def zigzag_level_order(nil), do: []

  def zigzag_level_order(root) do
    # Basically what we did is do the level order traversal
    # and then do zigzag all the values
    levels = level_traverse([root], [])

    levels
    |> Enum.reduce({[], rem(length(levels), 2) == 1}, fn level, {acc, rev?} ->
      level = if rev?, do: level |> Enum.reverse(), else: level
      {[level | acc], !rev?}
    end)
    |> elem(0)
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
