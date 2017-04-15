defmodule WikipediaClient do
  def search_for(topic, amount) do
    "https://en.wikipedia.org/w/api.php?action=opensearch&search=#{topic}&limit=#{amount}&namespace=0&format=json"
    |> Client.get
    |> Response.convert
  end
end
