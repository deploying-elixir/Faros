defmodule PostService.PostRepository do
  import Ecto.Query

  def create(name, description) do
    {:ok, post} =
      %PostService.Post{name: name, description: description}
      |> PostService.Repo.insert
    post
  end

  def findById(id) do
    query = from p in PostService.Post, where: p.id == ^id, select: p
    PostService.Repo.one(query)
  end
end
