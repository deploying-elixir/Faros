defmodule FarosService.PostController do
  use FarosService.Web, :controller

  def create(conn, %{"url" => url, "description" => description}) do
    PostService.create(url, description) # Will save the entered url to the database
    redirect conn, to: post_path(conn, :new)
  end

  def new(conn, _params) do
    # Render the page which will allow the user to input the post they want to save
    render conn, "new_post.html"
  end

  def show_all(conn, _params) do
    all_posts = PostService.all()
    render conn, "all_posts.html", all_posts: all_posts
  end
end
