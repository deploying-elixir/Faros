defmodule PostService.Repo.Migrations.CreatePosts do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :post_name, :string
      add :post_description, :string
    end
  end
end
