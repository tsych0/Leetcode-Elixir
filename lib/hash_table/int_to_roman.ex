# https://leetcode.com/problems/integer-to-roman/
defmodule IntToRoman do
  @mapping [
    {1000, "M"},
    {900, "CM"},
    {500, "D"},
    {400, "CD"},
    {100, "C"},
    {90, "XC"},
    {50, "L"},
    {40, "XL"},
    {10, "X"},
    {9, "IX"},
    {5, "V"},
    {4, "IV"},
    {1, "I"}
  ]

  @spec int_to_roman(num :: integer) :: String.t()
  def int_to_roman(num) do
    @mapping
    |> Enum.reduce({num, []}, fn
      {dec, rom}, {n, res} -> {rem(n, dec), [res | String.duplicate(rom, div(n, dec))]}
    end)
    |> elem(1)
    |> to_string()
  end
end
