defmodule Dealer do
  def init do
    p1 = spawn(Player, :init, [{:p1, [1,2,3,4]}])
    p2 = spawn(Player, :init, [{:p2, [5,6,7,8]}])

    send p1, {self, :p1, :top_card}
    send p2, {self, :p2, :top_card}

    receive do
      {pid1, :card, card} -> IO.puts "#{inspect pid1} played the #{card}"
    end

    receive do
      {pid2, :card, card} -> IO.puts "#{inspect pid2} played the #{card}"
    end
  end
end


defmodule Player do

  def init({tag, n}) do
    Agent.start(fn -> n end, name: tag)
    receive_loop
  end

  def receive_loop do
    receive do
      {pid, tag, :top_card} -> 
        card = Agent.get(tag, fn(cards) -> hd(cards) end)
        Agent.update(tag, fn(cards) -> tl(cards) end)
        send pid, {self, :card, card}

    end

    receive_loop

  end
end

