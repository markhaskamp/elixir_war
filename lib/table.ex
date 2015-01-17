
defmodule Table do
  def init do
    Agent.start(fn -> [] end, name: CardsPlayed)

    _receive_loop
  end

  defp _receive_loop do
    receive do
      {tag, :card_played, card_played} ->
          IO.puts "card played by #{tag}: #{card_played}"
    end

    _receive_loop
  end
end
