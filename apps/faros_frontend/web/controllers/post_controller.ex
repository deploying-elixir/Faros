defmodule FarosFrontend.PostController do
  use FarosFrontend.Web, :controller

  def create(conn, %{"url" => url, "description" => description}) do
    PostService.create(url, description)
    redirect conn, to: post_path(conn, :new)
  end

  def new(conn, _params) do
    all_posts = PostService.all()
    render conn, "new_post.html", all_posts: all_posts
  end
end
