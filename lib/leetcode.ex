defmodule Leetcode do
  alias Graphs.CourseSchedule
  # alias Tree.BuildTreeInMarkers
  use Application

  def start(_type, _args) do
    main()
    Supervisor.start_link([], strategy: :one_for_one)
  end

  def main() do
    # BuildTreePreIn.build_tree([3, 9, 20, 15, 7], [9, 3, 15, 20, 7])
    # BuildTreeInMarkers.build_tree([3, 9, 20, nil, nil, 15, 7])
    # |> IO.inspect()
    CourseSchedule.find_order(4, [[1, 0], [2, 0], [3, 1], [3, 2]]) |> IO.inspect()
  end
end
