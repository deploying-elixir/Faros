defmodule Wikipedia.Search do

  # the format of the query will be: %{topic: "pizza", amount: 5}
  # The method returns a list of results in the format %Result{title: title, description: "text", link: link}
  def for_topic(%{topic: topic, amount: amount}) do
    WikipediaClient.search_for(topic, amount)
  end
end
