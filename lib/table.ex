import Game

defmodule Table do
  def init do
    _createCardsPlayedAgent
    _receive_loop
  end

  defp _receive_loop do
    receive do
      {:card_played, map, top_card} ->
        IO.puts "I have a card on the table: #{top_card}"
        _addCardToTable(map, top_card)

        if _everyone_has_played do
          IO.puts "Everyone has played"

          player_map = _get_winning_player_map
          IO.puts("winning player_map: #{inspect(player_map)}")

          cards = _collect_all_cards_on_table
          IO.puts("new cards: #{cards}")

          send(player_map[:pid], {:add_cards, player_map[:agent_tag], cards})
        end

      :show_cards -> _show_table_cards
    end

    _receive_loop
  end

  defp _createCardsPlayedAgent do
    Agent.start(fn -> [] end, name: CardsPlayed)
  end

  defp _addCardToTable(player_map, card) do
    Agent.update(CardsPlayed, &([{card, player_map} | &1]))
  end

  defp _everyone_has_played do
    num_players = Agent.get(Players, &(Enum.count(&1)))
    num_cards_played = Agent.get(CardsPlayed, &(Enum.count(&1)))

    (num_players == num_cards_played)
  end

  defp _show_table_cards do
    IO.puts("inspect: ", inspect(Agent.get(CardsPlayed, &(&1))))
  end

  defp _get_winning_player_map do
    elem(Enum.max(Agent.get(CardsPlayed, fn(cards) -> cards end)), 1)
  end
  
  defp _collect_all_cards_on_table do
    Agent.get(CardsPlayed, &(&1))

    |>
    Enum.reduce([], fn(card, acc) -> [elem(card,0) | acc] end)
  end
end

