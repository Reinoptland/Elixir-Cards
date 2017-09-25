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

  def deal([head | tail]) do
    %{:deck => tail, :hand => [head]}
  end

  def deal(deck, hand, 0) do
    %{:deck => deck, :hand => hand}
  end

  def deal(deck, hand, number_of_cards_to_deal) do
    hand = [hd(deck) | hand]
    deck = tl(deck)
    deal(deck, hand, number_of_cards_to_deal - 1)
  end
end
