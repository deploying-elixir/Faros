defmodule WikipediaClient do
  def search_for(topic, amount) do
    url = "https://en.wikipedia.org/w/api.php?action=opensearch&search=#{topic}&limit=#{amount}&namespace=0&format=json"

    url
    |> Client.get
    |> Response.convert
  end
end
