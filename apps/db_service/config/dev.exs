use Mix.Config

config :logger, :console, format: "[$level] $message\n"

config :db_service,
  ecto_repos: [DbService.Repo]

# Configure your database
config :db_service, DbService.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "db_service_dev",
  hostname: "localhost",
  pool_size: 10
