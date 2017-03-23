use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :db_service,
  ecto_repos: [DbService.Repo]

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :db_service, DbService.Repo,
  pool: Ecto.Adapters.SQL.Sandbox,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "db_service_test",
  hostname: "localhost"

