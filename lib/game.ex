import Player
import Table

defmodule Game do

  def init do
    pTable = spawn(Table, :init, [])
    Agent.start(fn -> pTable end, name: TablePid)

    p1 = spawn(Player, :init, [{:p1, [1,2,3,4]}])
    p2 = spawn(Player, :init, [{:p2, [11,12,13,14]}])

    start(p1, p2)
  end

  def start(p1, p2) do
    send p1, {:p1, :play_a_card}
    send p2, {:p2, :play_a_card}
  end

end


