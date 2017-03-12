defmodule FarosService.PostController do
  use FarosService.Web, :controller

  def create(conn, %{"url" => url}) do
    # Call the other umbrella app directly
    PostService.create(url) # Will save the entered url to the database
    redirect conn, to: post_path(conn, :new)
  end

  def new(conn, _params) do
    # Render the page which will allow the user to input the post they want to save
    render conn, "new_post.html"
  end

  def show_all(conn, _params) do
    IO.puts "Showing all posts"
    render conn, "all_posts.html"
  end
end
