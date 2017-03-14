use Mix.Config

config :logger, :console, format: "[$level] $message\n"

config :post_service,
  ecto_repos: [PostService.Repo]

# Configure your database
config :post_service, PostService.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "faros_service_dev",
  hostname: "localhost",
  pool_size: 10
