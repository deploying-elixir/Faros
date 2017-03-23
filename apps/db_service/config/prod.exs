use Mix.Config

config :logger, level: :info

config :db_service, DbService.Repo,
adapter: Ecto.Adapters.Postgres,
url: System.get_env("DATABASE_URL"),
pool_size: String.to_integer(System.get_env("POOL_SIZE") || "10"),
ssl: true
