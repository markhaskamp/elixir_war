# defmodule Game do
#   def start do
#     player1 = spawn(Player, :init, [[1,2,3,4]])
# 
#     send player1, :top_card
#   end
# end
# 
# 
# defmodule Player do
#   def init(cards) do
#     Agent.start(fn -> cards end, name: Foo)
#   end
# 
#   def top_card do
#     top_card = Agent.get(Foo, &(hd(&1)))
#     Agent.update(Foo, &(tl(&1)))
#     IO.puts top_card
#   end
# end
# 
