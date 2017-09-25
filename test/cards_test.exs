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
end
