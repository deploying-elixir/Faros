defmodule FarosFrontend.PageController do
  use FarosFrontend.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
