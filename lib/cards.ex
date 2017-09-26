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

  # --------- Without the tutorial -----------

  def shuffle(deck) do
    Enum.take_random(deck, length(deck))
  end

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
  # --------- Now with the tutorial -----------

  # According to tutorial (duh!)
  # def shuffle(deck) do
  #   Enum.shuffle(deck)
  # end

  # My "solution" (does not work)
  # def create_deck_advanced do
  #   values = ["Ace", "Two", "Three", "Four", "Five"]
  #   suits = ["Spades", "Clubs", "Hearts", "Diamonds"]
  #   deck = []
  #
  #   Enum.each(values, fn(value) -> Enum.each(suits, fn(suit) -> deck = deck ++ ["#{value} of #{suit}"] end) end)
  #   deck
  # end

  # "Bad" example with nested comprehension
  # def create_deck_advanced do
  #   values = ["Ace", "Two", "Three", "Four", "Five"]
  #   suits = ["Spades", "Clubs", "Hearts", "Diamonds"]
  #
  #   cards = for suit <- suits do
  #     for value <- values do
  #       "#{value} of #{suit}"
  #     end
  #   end
  #   returns [[cards], [cards], [cards], [cards]]
  #   List.flatten(cards)
  # end

  @doc """
  Create deck advanced (tutorial solution)
  pretty hard to fit the deck on one line
  ## Examples

      iex> Cards.create_deck_advanced
      ["Ace of Spades", "Two of Spades", "Three of Spades", "Four of Spades", "Five of Spades", "Ace of Clubs", "Two of Clubs", "Three of Clubs", "Four of Clubs", "Five of Clubs", "Ace of Hearts", "Two of Hearts", "Three of Hearts", "Four of Hearts", "Five of Hearts", "Ace of Diamonds", "Two of Diamonds", "Three of Diamonds", "Four of Diamonds", "Five of Diamonds"]

  """
  def create_deck_advanced do
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

    for suit <- suits, value <- values do
      "#{value} of #{suit}"
    end
  end

  @doc """
  pretty_deal (tutorial solution)
  ## Examples

      iex> Cards.create_deck_advanced |> Cards.pretty_deal(5)
      {["Ace of Spades", "Two of Spades", "Three of Spades", "Four of Spades", "Five of Spades"], ["Ace of Clubs", "Two of Clubs", "Three of Clubs", "Four of Clubs", "Five of Clubs", "Ace of Hearts", "Two of Hearts", "Three of Hearts", "Four of Hearts", "Five of Hearts", "Ace of Diamonds", "Two of Diamonds", "Three of Diamonds", "Four of Diamonds", "Five of Diamonds"]}

  """

  # According to tutorial (duh!)
  def pretty_deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end
  # returns a tuple -> {hand, deck(remainder)}

  # tutorial solution for save_deck uses an erlang method for formatting
  def save_deck_pretty(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  # tutorial solutions for load deck
  # def load_deck_pretty(filename) do
  #   {status, binary } = File.read(filename)
  #
  #   case status do
  #     :ok -> :erlang.binary_to_term(binary)
  #     :error -> "That file does not exist"
  #   end
  # end

  # prettier tutorial solutions for load deck
  def load_deck_prettier(filename) do
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term binary
      {:error, _reason} -> "That file does not exist"
    end
  end

  # My solution
  def deal_hand_from_new_shuffled_deck(hand_size) do
    create_deck_advanced
    |> shuffle
    |> pretty_deal(hand_size)
  end
end
