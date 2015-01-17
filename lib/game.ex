import Player

defmodule Game do

  def init do
    p1 = spawn(Player, :init, [{:p1, [1,2,3,4]}])
    p2 = spawn(Player, :init, [{:p2, [11,12,13,14]}])

    send p1, {:p1, :play_a_card}
    send p2, {:p2, :play_a_card}

    # start
  end

  # def start do

  #   receive do
  #   end
  # end

end


