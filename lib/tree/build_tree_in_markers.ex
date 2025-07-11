defmodule Tree.BuildTreeInMarkers do
  @spec build_tree(inorder :: [integer | nil]) :: TreeNode.t() | nil
  def build_tree([]), do: {nil, []}
  def build_tree([nil | rest]), do: {nil, rest}

  def build_tree([head | tail]) do
    {left, rest} = build_tree(tail)
    {right, rem} = build_tree(rest)

    parent = %TreeNode{
      val: head,
      left: left,
      right: right
    }

    {parent, rem}
  end
end
