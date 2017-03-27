defmodule Twitter.Client do

  def get(uri, headers) do
    :hackney.get(uri, headers)
  end

  def get_with_parsed_body(uri, headers) do
    :hackney.get(uri, headers)
    |> parse_body
  end

  defp parse_body({:ok, _status, _headers, client}) do
    {:ok, body} = :hackney.body(client)
    body
  end
end
