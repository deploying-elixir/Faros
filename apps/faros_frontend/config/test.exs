use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :faros_frontend, FarosFrontend.Endpoint,
  http: [port: 4001],
  server: false

config :faros_frontend, search: Core.FakeSearch

# Print only warnings and errors during test
config :logger, level: :warn
