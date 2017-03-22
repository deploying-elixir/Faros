defmodule DbService.PostRepository do
  import Ecto.Query

  def create(name, description) do
    {:ok, post} =
      %DbService.Post{name: name, description: description}
      |> DbService.Repo.insert
    post
  end

  def findById(id) do
    query = from p in DbService.Post, where: p.id == ^id, select: p
    DbService.Repo.one(query)
  end
end
