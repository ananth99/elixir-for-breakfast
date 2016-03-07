defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(string) :: String.t()
  def abbreviate(string) do
    String.replace(string, ~r/[^[:alnum]]/u, " ")
    |> String.split
    |> Enum.map(&acronymize(&1))
    |> Enum.join("")
  end
  @doc """
  Takes a word as input and fetches the acronym for that word
  """
  @spec acronymize(string) :: Map.t()
  def acronymize(word) do
    [h | t] = String.split(word, "")

    rest = Enum.filter(t, fn(x) ->
      Regex.scan(~r/[A-Z]/u, x)
      |> length
      |> Kernel.!=(0)
    end)
    |> List.flatten
    [String.upcase(h) | rest]
  end
end



