
defmodule Player do

  def init({agent_tag, cards}) do
    Agent.start(fn -> cards end, name: agent_tag)

    _receive_loop
  end

  defp _receive_loop do
    receive do
      {tag, :play_a_card} ->
          top_card = Agent.get(tag, fn(cards) -> hd(cards) end)
          Agent.update(tag, fn(cards) -> tl(cards) end)

          pTable = Agent.get(TablePid, fn(p) -> p end)
          send pTable, {tag, :card_played, top_card}
    end

    _receive_loop
  end
end
