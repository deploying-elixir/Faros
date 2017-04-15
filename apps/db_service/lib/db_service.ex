defmodule DbService do

  @doc """
  Persist a post entity to the database

  ## Examples
      iex> DbService.persist(%{post_url: "a-url", description: "a-description"})
      %DbService.Post{__meta__: #Ecto.Schema.Metadata<:loaded, "posts">, description: "a-description", id: 24, name: "a-url"}

  """
  @spec persist(map) :: %DbService.Post{}
  def persist(data) do
    DbService.PostRepository.create(data[:post_url], data[:description])
  end

  @doc """
  Retrieves all post entities from the database

  ## Examples
      iex> DbService.persist(%{post_url: "a-url", description: "a-description"})
      iex> DbService.all()
      [%DbService.Post{__meta__: #Ecto.Schema.Metadata<:loaded, "posts">, description: "a-description", id: 24, name: "a-url"}]

  """
  @spec all() :: list(%DbService.Post{})
  def all() do
    DbService.PostRepository.all()
  end
end
