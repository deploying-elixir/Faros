defmodule Twitter.User do
  @derive [Poison.Encoder]
  defstruct [
    :name,
    :description,
    :screen_name,
    :profile_image_url,
    :location
  ]
end
