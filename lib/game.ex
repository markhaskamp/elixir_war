import Player
import Table

defmodule Game do

  def init do
    table_pid = spawn(Table, :init, [])
    Agent.start(fn -> table_pid end, name: TablePid)

    Agent.start(fn -> [6,7,8,9]     end, name: :p1)
    Agent.start(fn -> [11,12,13,14] end, name: :p2)

    p1 = spawn(Player, :ready, [])
    p2 = spawn(Player, :ready, [])

    p1map = %{:pid => p1, :agent_tag => :p1}
    p2map = %{:pid => p2, :agent_tag => :p2}

    Agent.start(fn -> [p1map, p2map] end, name: Players)
  end

  def start do
    Agent.get(Players, fn(list) -> list end)
    |>
    Enum.map (fn(m) -> send(m[:pid], {m, :play_card}) end)
  end

end


