defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  test "creates a new deck" do
    assert Cards.create_deck == ["Ace", "Two", "Three"]
  end

  test "shuffles a deck" do
    # this test will fail 1/6 times for now
    assert Cards.shuffle(["Ace", "Two", "Three"]) != ["Ace", "Two", "Three"]
  end

  test "deal a single card from a deck" do
    # simple version
    assert Cards.deal(["Ace", "Two", "Three"]) == %{:deck => ["Two", "Three"], :hand => ["Ace"]}
  end

  test "deal a number of cards from a deck" do
    # more advanced
    assert Cards.deal(["Ace", "Two", "Three"],[] , 2) == %{:deck => ["Three"], :hand => ["Two", "Ace"]}
  end

  test "checks if a deck contains a certain card" do
    assert Cards.contains?(["Ace", "Two", "Three"], "Ace") == true
    assert Cards.contains?(["Ace", "Two", "Three"], "King") == false
  end

  test "save a deck by writing it to a file and load it again" do
    File.rm("deck_1")
    assert Cards.save_deck(["Ace", "Two", "Three"], "deck_1") == :ok
    assert Cards.load_deck("deck_1") == ["Ace", "Two", "Three"]
  end

  test "save a deck by writing it to a file and load it again (pretty)" do
    File.rm("deck_1")
    assert Cards.save_deck_pretty(["Ace", "Two", "Three"], "deck_1") == :ok
    assert Cards.load_deck_prettier("deck_1") == ["Ace", "Two", "Three"]
  end

  test "give an error when a loading a deck from a file that does not exist" do
    File.rm("deck_1")
    assert Cards.load_deck_prettier("deck_1") == "That file does not exist"
  end

  test "create a deck and deal a shuffled hand from it of a certain size" do
    {hand, deck} = Cards.deal_hand_from_new_shuffled_deck(5)
    assert length(hand) == 5
    assert hand != ["Ace of Spades", "Two of Spades", "Three of Spades", "Four of Spades", "Five of Spades"newssert length(deck) == 15
  end
end
