defmodule FarosService.PostController do
  use FarosService.Web, :controller

  def create(conn, _params) do
    # Call the other umbrella app
    PostService.create

    redirect conn, to: post_path(conn, :new)
  end

  def new(conn, _params) do
    # Render the page which will allow the user to input the post they want to save
    render conn, "new_post.html"

  end
end
