defmodule FarosService.PageController do
  use FarosService.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
