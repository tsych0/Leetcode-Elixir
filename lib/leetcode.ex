defmodule Leetcode do
  alias Graphs.FindCheapestPrice
  use Application

  def start(_type, _args) do
    main()
    Supervisor.start_link([], strategy: :one_for_one)
  end

  def main() do
    # FindCheapestPrice.find_cheapest_price(
    #   4,
    #   [[0, 1, 1], [0, 2, 5], [1, 2, 1], [2, 3, 1]],
    #   0,
    #   3,
    #   1
    # )
    FindCheapestPrice.find_cheapest_price(
      5,
      [[0, 1, 5], [1, 2, 5], [0, 3, 2], [3, 1, 2], [1, 4, 1], [4, 2, 1]],
      0,
      2,
      2
    )
    |> IO.inspect()
  end
end
