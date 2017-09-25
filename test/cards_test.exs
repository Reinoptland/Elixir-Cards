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
    assert Cards.deal(["Ace", "Two", "Three"],[] , 2) == %{:deck => ["Three"], :hand => ["Two", "Ace"]}
  end
end
