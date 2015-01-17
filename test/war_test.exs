defmodule WarTest do
  use ExUnit.Case

  test "the truth" do
    assert 1 + 1 == 2
  end

  test "deal" do
    cards = [1,2,3,4,5,6]
    hands = Cards.deal cards
    assert Enum.at(hands, 0) == [1,3,5]
    assert Enum.at(hands, 1) == [2,4,6]
  end
end
