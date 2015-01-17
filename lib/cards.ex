defmodule Cards do

  def new_deck() do
    for value <- [2,3,4,5,6,7,8,9,10,"J","Q","K","A"], suit <- ["S", "H", "C", "D"], do: {value, suit}
  end

  def shuffle(list) do
    :random.seed(:erlang.now())
    shuffle(list, [])
  end

  # shuffle(cards-to-shuffle, shuffled-cards)
  def shuffle([], acc) do
    # no more cards to be shuffled
    acc
  end

  # list is the collection of cards to-be-shuffled
  # acc is the shuffled cards
  def shuffle(list, acc) do
    # gen a random number between 0 and the count of the cards yet to be shuffled
    next_card_ndx = :random.uniform(Enum.count(list)) - 1

    # from cards to-be-shuffled, split into two lists
    # the head of the 2nd list is our next 'shuffled' card
    {leading, [h | t]} = Enum.split(list, next_card_ndx - 1)

    # add 'h' to the shuffled list.
    # remove 'h' from the to-be-shuffled list
    shuffle(leading ++ t, [h | acc])
  end

  def deal(cards) do
    h1 = Enum.take_every cards, 2
    h2 = Enum.take_every(Enum.drop(cards,1), 2)
    [h1, h2]
  end

end

