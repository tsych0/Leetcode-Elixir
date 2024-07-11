defmodule Leetcode do
  use Application

  def start(_type, _args) do
    main()
    Supervisor.start_link([], strategy: :one_for_one)
  end

  def main() do
    BuildTreePreIn.build_tree([3, 9, 20, 15, 7], [9, 3, 15, 20, 7])
    |> IO.inspect()
  end
end
