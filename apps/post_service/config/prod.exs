use Mix.Config

config :logger, level: :info

config :post_service, PostService.Repo,
adapter: Ecto.Adapters.Postgres,
url: System.get_env("DATABASE_URL"),
pool_size: String.to_integer(System.get_env("POOL_SIZE") || "10"),
ssl: true
