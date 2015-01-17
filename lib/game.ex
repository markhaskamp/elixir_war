import Player
import Table

defmodule Game do

  def init do
    pTable = spawn(Table, :init, [])
    Agent.start(fn -> pTable end, name: TablePid)

    p1 = spawn(Player, :init, [{:p1, [1,2,3,4]}])
    p2 = spawn(Player, :init, [{:p2, [11,12,13,14]}])

    Agent.start(fn -> [{:p1,p1}, {:p2,p2}] end, name: Players)
  end

  def start do
    Agent.get(Players, fn(list) -> list end)

    |>
    Enum.map (&(send(elem(&1,1), {elem(&1,0), :play_a_card})))
  end

end


