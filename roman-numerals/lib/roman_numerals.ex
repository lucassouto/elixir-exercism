defmodule RomanNumerals do
  @doc """
  Convert the number to a roman number.
  """
  @numerals [
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

  @spec numeral(pos_integer) :: String.t()
  def numeral(number) when number >= 1 do
    res = Enum.find(@numerals, fn {num, _} -> number >= num end)
    elem(res, 1) <> numeral(number - elem(res, 0))
  end

  def numeral(_), do: ""
end
