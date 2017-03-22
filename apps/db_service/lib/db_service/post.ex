defmodule DbService.Post do
  use Ecto.Schema

  schema "posts" do
    field :name, :string
    field :description, :string
  end
end
