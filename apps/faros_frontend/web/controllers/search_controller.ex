defmodule FarosFrontend.SearchController do
  use FarosFrontend.Web, :controller

  def index(conn, _params) do
    results = case get_flash(conn, :results) do
                nil -> []
                results -> results
              end

    render conn, "index.html", results: results
  end

  def search(conn, %{"topic" => topic, "amount" => amount}) do
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

    updated_conn = put_flash(conn, :results, result)

    # FarosFrontend.Endpoint.broadcast(
    #   "search:results",
    #   "new_search",
    #   %{body: result}
    # )

    # send_resp(conn, 201, "")
    redirect updated_conn, to: search_path(updated_conn, :index)
  end
end
