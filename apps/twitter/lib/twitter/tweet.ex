defmodule Twitter.Tweet do
  @derive [Poison.Encoder]
  defstruct [
    :id,
    :created_at,
    :text,
    :user,
    :retweet_count,
    :favorite_count,
    :favorited,
    :retweeted,
    url: ""
  ]
end
