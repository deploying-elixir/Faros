defmodule Twitter.Authentication do

  def for_get_request(uri) do
    {header, _params} = sign_request("get", uri, [])
    |> get_oauth_header
    header
  end

  defp sign_request(request, uri, params) do
    creds = OAuther.credentials(
      consumer_key:    get_from_config(:consumer_key),
      consumer_secret: get_from_config(:consumer_secret),
      token:           get_from_config(:token),
      token_secret:    get_from_config(:token_secret)
    )

    OAuther.sign(request, uri, params, creds)
  end

  defp get_oauth_header(values), do: OAuther.header(values)

  defp get_from_config(value), do: Application.get_env(:twitter, value)
end
