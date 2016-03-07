defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map()
  def count(sentence) do
    sentence
    |> process_words
    |> count_words
  end

  def count_words(words) do
    Enum.reduce(words, %{}, &update_count/2)
  end

  def update_count(word, acc) do
   Map.update acc, word, 1, &(&1 + 1)
  end

  def process_words(words) do
    # remove all punctuations
    String.replace(words, ~r/[^[:alnum] _-]/u, " ")
    |> String.strip
    |> String.downcase
    |> String.split
  end
end
