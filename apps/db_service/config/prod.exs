use Mix.Config

config :logger, level: :info

config :db_service, DbService.Repo,
  adapter: Ecto.Adapters.Postgres,
  ssl: true,
  username: “${DB_USER}“,
  password: “${DB_PASSWORD}“,
  database: “${DB_NAME}“,
  hostname: “${DB_HOST}“,
  pool_size: 20

