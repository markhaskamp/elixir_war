defmodule Foo do
  def init do
    p  = spawn(Bar, :init, [{:a, 1}])
    p2 = spawn(Bar, :init, [{:b, 101}])

    send p,  {:a, :ed}
    send p2, {:b, :ed}
  end

end


defmodule Bar do

  def init({tag, n}) do
    Agent.start(fn -> n end, name: tag)
    receive_loop
  end

  def receive_loop do
    receive do
      {tag, :ed} -> Agent.get(tag, fn(x) -> IO.puts(x) end)
    end

  end
end


