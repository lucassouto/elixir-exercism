defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """

  @spec match(String.t(), [String.t()]) :: [String.t()]
  def match(base, candidates) do
    Enum.filter(candidates, fn x -> equal_split_words?(base, x) and not equal_words?(base, x) end)
  end

  @spec equal_words?(String.t(), String.t()) :: boolean()
  defp equal_words?(base, candidate), do: String.downcase(base) == String.downcase(candidate)

  @spec equal_split_words?(String.t(), String.t()) :: boolean()
  defp equal_split_words?(base, candidate), do: split_words(base) == split_words(candidate)

  @spec split_words(String.t()) :: [String.t()]
  defp split_words(word), do: word |> String.downcase() |> String.graphemes() |> Enum.sort()
end
