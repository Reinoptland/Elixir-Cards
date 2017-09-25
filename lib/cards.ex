defmodule Cards do
  @moduledoc """
  Documentation for Cards.
  """

  @doc """
  Hello world.

  RJJ: Wow you can write tests in here!
  ## Examples

      iex> Cards.hello
      "hi there"

  """
  def hello do
    "hi there"
  end

  def create_deck do
    ["Ace", "Two", "Three"]
  end

  def shuffle(deck) do
    Enum.take_random(deck, length(deck))
  end
end
