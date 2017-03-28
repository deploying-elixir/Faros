defmodule FarosFrontend.SearchController do
  use FarosFrontend.Web, :controller
  #need to put a wrapper around memorydb
  def index(conn, _params) do
    [%{results: all_results}] = case MemoryDb.lookup(%{type: :search}) do
                [] -> [%{results: []}]
                %{} -> %{results: []}
                results -> results
    end

    render conn, "index.html", results: all_results
  end

  def search(conn, query) do
    search = Application.get_env(:faros_frontend, :search)

    search.execute(query)

    redirect conn, to: search_path(conn, :index)
  end
end
