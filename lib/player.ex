
defmodule Player do

  def ready do
    _receive_loop
  end

  defp _receive_loop do
    receive do
      {map, :show_cards} ->
        agent_tag = map[:agent_tag]
        IO.puts("#{agent_tag}. #{inspect(Agent.get(agent_tag, fn(cards) -> cards end))}")

      {map, :play_card} ->
        top_card = Agent.get(map[:agent_tag], fn(cards) -> hd(cards) end)
        Agent.update(map[:agent_tag], fn(cards) -> tl(cards) end)
        send(Agent.get(TablePid, &(&1)), {:card_played, map, top_card})

      {:add_cards, agent_tag, new_cards} ->
        Agent.update(agent_tag, fn(cards) -> List.flatten(Enum.reverse([new_cards | Enum.reverse(cards)])) end)
    end

    _receive_loop
  end
end
