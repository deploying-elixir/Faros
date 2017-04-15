defmodule PostServiceTest do
  use ExUnit.Case

  setup do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(DbService.Repo)
  end

  test "post service persists a post" do
    post =  PostService.create("a-post", "a-description")

    assert post.name == "a-post"
    assert post.description == "a-description"
  end

  test "post service retrieves all posts" do
    PostService.create("a-post", "a-description")
    PostService.create("another-post", "another-description")

    all_posts = PostService.all()

    assert length(all_posts) == 2
  end
end
