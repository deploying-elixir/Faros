defmodule PostService do
  def create(new_post, description) do
    DbService.persist("post", %{:post_url => new_post,
                                :description => description})
  end

  def all() do
    DbService.all()
  end
end
