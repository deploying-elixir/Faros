defmodule Core.RealSearch do

  def execute(%{"topic" => topic, "amount" => amount}) do
    query = %{topic: topic, amount: String.to_integer(amount)}

    # ----------
    # Stage 1: Non-Distributed
    # ----------
    all_results = Enum.map([Wikipedia.Search], fn(search_service) -> search_service.for_topic(query) end)

    result = List.flatten(all_results)

    # ----------
    # Stage 2
    # ----------
    #    Application.get_env(:faros_frontend, :parent_node)
    #    |> Node.start
    #
    #    Application.get_env(:faros_frontend, :children_nodes)
    #    |> Enum.each(&Node.connect/1)
    #    nodes = Node.list

    # modules_with_nodes = [
    #   {Twitter.Search, "twitter@node"},
    #     {Wiki.Search, "wiki@node"},
    #     ]
    #     service_results = Enum.map(modules_with_nodes, fn({mod, node}) -> :rpc.call(node, mod, :for_topic. [query])
    #     end)
    #
    # result = case service_results do
    #           {good, _bad} -> good |> List.flatten
    #           :true -> []
    #         end

    # ----------
    # Note:
    # ----------
    # If we didn't have the namespace problem we could just do:
    #    r = :rpc.multicall(nodes, Search, :for_topic, [query])

    MemoryDb.store(topic, result)
end
end
