defmodule DbService.PostRepositoryTest do
  use ExUnit.Case

  alias DbService.PostRepository

  setup do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(DbService.Repo)
  end

  test "post can be persisted" do
    post = PostRepository.create("post-name", "post-description")
    retrievedPost = PostRepository.findById(post.id)

    assert retrievedPost.name == "post-name"
    assert retrievedPost.description == "post-description"
  end

  test "all posts are retrieved" do
    PostRepository.create("post-1", "post-description")
    PostRepository.create("post-2", "post-description")

    all_posts = PostRepository.all()

    assert length(all_posts) == 2
  end
end

