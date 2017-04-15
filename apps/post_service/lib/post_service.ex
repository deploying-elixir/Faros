defmodule PostService do
  @doc """
  Stores a posts

  ## Examples
      iex> PostService.create("www.mypost.com", "a great post on me")
      iex> %DbService.Post{__meta__: #Ecto.Schema.Metadata<:loaded, "posts">,
           description: "a great post on me", id: 14, name: "www.post.com"}
  """
  @spec create(String.t, String.t) :: struct
  def create(new_post, description) do
    DbService.persist(%{:post_url => new_post,
                        :description => description})
  end

  @doc """
  Retrieves all the posts

  ## Examples
      iex> PostService.create("www.mypost.com", "a great post on me")
      iex> PostService.create("www.anotherpost.com", "another great post on me")
      iex> PostService.all()
      iex> [%DbService.Post{__meta__: #Ecto.Schema.Metadata<:loaded, "posts">, description: "a great post on me", id: 13, name: "www.mypost.com"},
            %DbService.Post{__meta__: #Ecto.Schema.Metadata<:loaded, "posts">, description: "another great post on me", id: 13, name: "www.anotherpost.com"}]
  """
  @spec all() :: list(struct)
  def all() do
    DbService.all()
  end
end
