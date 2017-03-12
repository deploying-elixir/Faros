defmodule PostService.PostRepositoryTest do
  use ExUnit.Case

  alias PostService.PostRepository

  test "post can be persisted" do

    post = PostRepository.create("post-name", "post-description")
    retrievedPost = PostRepository.findById(post.id)

    assert retrievedPost.name == "post-name"
    assert retrievedPost.description == "post-description"
  end
end

