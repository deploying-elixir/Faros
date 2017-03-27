defmodule Twitter.Request do
  def build(uri, params) do
    uri <> "?" <> URI.encode_query(params)
  end
end
