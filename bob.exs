defmodule Bob do
  @doc """
  Takes random input for Bob. Return appropriate response.
  """
  def hey(input) do
    cond do
      # Response for a question
      String.ends_with? input, "?" ->
        "Sure."
      String.strip(input) |> String.length == 0  ->
        "Fine. Be that way!"
      # Shouted
      shouted? input ->
        "Whoa, chill out!"
      true ->
        "Whatever."
    end
  end

  def shouted? string do
    no_lowercase =  ~r/^[[:^lower:]]+$/
    letters = ~r/[[:alpha:]]/

    String.match?(string, no_lowercase) and String.match?(string, letters)
  end
end
