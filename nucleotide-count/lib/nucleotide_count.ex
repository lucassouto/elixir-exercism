defmodule NucleotideCount do
  @nucleotides [?A, ?C, ?G, ?T]

  @doc """
  Counts individual nucleotides in a DNA strand.

  ## Examples

  iex> NucleotideCount.count('AATAA', ?A)
  4

  iex> NucleotideCount.count('AATAA', ?T)
  1
  """
  @spec count([char], char) :: non_neg_integer
  def count(strand, nucleotide) do
    NucleotideCount.histogram(strand)[nucleotide]
  end

  @doc """
  Returns a summary of counts by nucleotide.

  ## Examples

  iex> NucleotideCount.histogram('AATAA')
  %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
  """
  @spec histogram([char]) :: map
  def histogram(strand) do
    map_nucleotides = @nucleotides |> Enum.map(fn x -> {x, 0} end) |> Map.new()
    strand |> Enum.reduce(map_nucleotides, fn x, acc -> Map.update(acc, x, 1, &(&1 + 1))
    end)
  end
end
