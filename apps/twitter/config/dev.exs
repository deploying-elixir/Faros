use Mix.Config

config :twitter,
  consumer_key: System.get_env("TWITTER_CONSUMER_KEY"),
  consumer_secret: System.get_env("TWITTER_CONSUMER_SECRET"),
  token: System.get_env("TWITTER_TOKEN"),
  token_secret: System.get_env("TWITTER_TOKEN_SECRET")
