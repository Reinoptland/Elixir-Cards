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

  # My solution
  def shuffle(deck) do
    Enum.take_random(deck, length(deck))
  end

  # According to tutorial (duh!)
  # def shuffle(deck) do
  #   Enum.shuffle(deck)
  # end

  # My solution (tutorial solution is the same)
  def contains?(deck, card) do
    Enum.member?(deck, card)
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

  def save_deck(deck, filename) do
    {:ok, file} = File.open filename, [:write]
    IO.binwrite(file, Enum.join(deck, ","))
    File.close file
  end

  def load_deck(filename) do
    {:ok, data} = File.read filename
    String.split(data, ",")
  end

  # My solution (does not work)
  # def create_deck_advanced do
  #   values = ["Ace", "Two", "Three", "Four", "Five"]
  #   suits = ["Spades", "Clubs", "Hearts", "Diamonds"]
  #   deck = []
  #
  #   Enum.each(values, fn(value) -> Enum.each(suits, fn(suit) -> deck = deck ++ ["#{value} of #{suit}"] end) end)
  #   deck
  # end

  def create_deck_advanced do
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

    for suit <- suits do
      for value <- values do
        "#{value} of #{suit}"
      end
    end
  end
end
