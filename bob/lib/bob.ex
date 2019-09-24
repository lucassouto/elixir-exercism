defmodule Bob do

  @spec hey(String.t) :: String.t
  def hey(input) do
    cond do
      empty?(input) -> "Fine. Be that way!"
      upcase?(input) && String.ends_with?(input, "?") -> "Calm down, I know what I'm doing!"
      String.ends_with?(input, "?") -> "Sure."
      upcase?(input) -> "Whoa, chill out!"
      true -> "Whatever."
    end
  end

  defp empty?(phrase), do: String.trim(phrase) == ""
  defp upcase?(phrase), do: String.upcase(phrase) == phrase && String.downcase(phrase) != phrase
end
