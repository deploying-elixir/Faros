defmodule Core.RealSearch do

  def execute(%{"topic" => topic, "amount" => amount} = query) do
IO.inspect("REAL SAERCH")
    query = %{topic: topic, amount: String.to_integer(amount)}

    Application.get_env(:pharos, :parent_node)
    |> Node.start

    Application.get_env(:pharos, :children_nodes)
    |> Enum.each(&Node.connect/1)
    nodes = Node.list

    r = :rpc.multicall(nodes, Search, :for_topic, [query])

    result = case r do
               {good, _bad} -> good |> List.flatten
               :true -> []
             end

    MemoryDb.store(topic, result)
  end
end
