defmodule Twitter.Transform do
  alias Twitter.Tweet
  alias Twitter.User

  def execute(response) do
    %{"statuses" => tweets} = Poison.decode!(
      ~s(#{response}), as: %{
        "search_metadata" => %{},
        "statuses" => [%Tweet{user: %User{}}]
      }
    )
    tweets
  end
end
