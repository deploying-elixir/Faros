defmodule DbServiceTest do
  use ExUnit.Case

  setup do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(DbService.Repo)
  end

  test "post is persisted" do
    post_to_save =  %{post_url: "post-url", description: "a-description"}

    post_persisted = DbService.persist(post_to_save)

    assert post_persisted.name == post_to_save[:post_url]
    assert post_persisted.description == post_to_save[:description]
  end

  test "retrieves all posts" do
    DbService.persist(%{post_url: "post-url", description: "a-description"})
    DbService.persist(%{post_url: "another-post-url", description: "another-description"})

    results = DbService.all()

    assert length(results) == 2
  end
end
