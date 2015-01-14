defmodule Foo do
  def init do
    p  = spawn(Bar, :init, [{:a, [1,2,3,4]}])
    p2 = spawn(Bar, :init, [{:b, [4,3,2,1]}])

    send p,  {:a, :top_card}
    send p2, {:b, :top_card}

    send p,  {:a, :top_card}
    send p2, {:b, :top_card}
  end

end


defmodule Bar do

  def init({tag, n}) do
    Agent.start(fn -> n end, name: tag)
    receive_loop
  end

  def receive_loop do
    receive do
      {tag, :top_card} -> 
        card = Agent.get(tag, fn(cards) -> hd(cards) end)
        Agent.update(tag, fn(cards) -> tl(cards) end)
        IO.puts card
    end

    receive_loop

  end
end


