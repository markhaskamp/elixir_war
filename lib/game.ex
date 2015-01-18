import Player
import Table

defmodule Game do

  def init do
    table_pid = spawn(Table, :init, [])
    Agent.start(fn -> table_pid end, name: TablePid)

    Agent.start(fn -> [16,17,18,19]     end, name: :p1)
    Agent.start(fn -> [11,12,13,14] end, name: :p2)

    p1 = spawn(Player, :ready, [])
    p2 = spawn(Player, :ready, [])

    p1map = %{:pid => p1, :agent_tag => :p1}
    p2map = %{:pid => p2, :agent_tag => :p2}

    Agent.start(fn -> [p1map, p2map] end, name: Players)
  end

  def play_round do
    Agent.get(Players, fn(list) -> list end)
    |>
    Enum.map(&(send(&1[:pid], {&1, :play_card})))
  end

  def show_cards do
    Agent.get(Players, fn(list) -> list end)
    |>
    Enum.map(&(send(&1[:pid], {&1, :show_cards})))
  end

end


