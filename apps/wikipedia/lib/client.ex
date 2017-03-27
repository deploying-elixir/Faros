defmodule Client do
  def get(url) do
    HTTPoison.get(url)
  end
end
