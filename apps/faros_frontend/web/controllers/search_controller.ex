defmodule FarosFrontend.SearchController do
  use FarosFrontend.Web, :controller

  def index(conn, _params) do
    results = MemoryDb.all()

    render conn, "index.html", results: results
  end

  def search(conn, query) do
    search = Application.get_env(:faros_frontend, :search)

    search.execute(query)

    redirect conn, to: search_path(conn, :index)
  end
end
