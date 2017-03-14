use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :post_service,
  ecto_repos: [PostService.Repo]

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :post_service, PostService.Repo,
  pool: Ecto.Adapters.SQL.Sandbox,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "post_service_test",
  hostname: "localhost"

