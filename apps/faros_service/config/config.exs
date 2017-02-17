# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :faros_service,
  ecto_repos: [FarosService.Repo]

# Configures the endpoint
config :faros_service, FarosService.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "ssffHm3ZGPg1a5aHZOr17XbI0jw5VwIXutba83/APJ5S5uuhLBM3ouvTqHmim4N0",
  render_errors: [view: FarosService.ErrorView, accepts: ~w(html json)],
  pubsub: [name: FarosService.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
