defmodule FarosFrontend.SearchController do
  use FarosFrontend.Web, :controller

  def index(conn, _params) do
    all_results = case MemoryDb.lookup(:search, :all)
     do
       {:all, :not_found} -> []
       all_results -> all_results
     end
    render conn, "index.html", results: all_results
  end

  def search(conn, query) do
    search = Application.get_env(:faros_frontend, :search)

    search.execute(query)

    redirect conn, to: search_path(conn, :index)
  end
end
