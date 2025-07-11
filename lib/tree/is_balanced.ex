# https://leetcode.com/problems/balanced-binary-tree/
defmodule Tree.IsBalanced do
  @spec is_balanced(root :: TreeNode.t() | nil) :: boolean
  def is_balanced(root) do
    balanced?(root) |> elem(0)
  end

  def balanced?(nil), do: {true, 0}

  def balanced?(root) do
    {left?, hl} = balanced?(root.left)

    if left? do
      {right?, hr} = balanced?(root.right)

      if right? and abs(hl - hr) < 2 do
        {true, max(hl, hr) + 1}
      else
        {false, 0}
      end
    else
      {false, 0}
    end
  end
end
