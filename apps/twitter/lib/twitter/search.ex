defmodule Search do
  alias Twitter.{Client, Authentication, Transform, Request, SearchParams}
  require Logger
  alias IO.ANSI

  @search_endpoint "https://api.twitter.com/1.1/search/tweets.json"

  def for_topic(query) do
    IO.inspect("=========================================")
    IO.inspect(query)
    IO.inspect("=========================================")
    uri = build_search_uri(query)
    header = build_oath_header(uri)

    Logger.info(
      ANSI.green_background
      <> ANSI.white
      <> "worker [#{node()}-#{inspect self()}] searching for #{inspect(query)}"
    )

    Client.get_with_parsed_body(uri, [header])
    |> Transform.execute
    |> build_tweet_url
    |> convert_to_result
  end

  defp build_tweet_url(tweets) do
    tweets
    |> Enum.map(fn(tweet) ->
      id = tweet.id
      screen_name = tweet.user.screen_name
      url = "https://twitter.com/#{screen_name}/status/#{id}"
      %{tweet | url: url}
    end)
  end

  defp convert_to_result(tweets) do
    tweets
    |> Enum.map(fn(tweet) ->
      %Result{
        title: tweet.id,
        description: tweet.text,
        link: tweet.url
  }
    end)
  end

  defp build_oath_header(uri) do
    Authentication.for_get_request(uri)
  end

  defp build_search_uri(query) do
    params = SearchParams.build(query)
    Request.build(@search_endpoint, params)
  end
end
