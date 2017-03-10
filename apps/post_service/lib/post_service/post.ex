defmodule PostService.Post do
  use Ecto.Schema

  schema "posts" do
    field :post_name, :string
    field :post_description, :string
  end
end
