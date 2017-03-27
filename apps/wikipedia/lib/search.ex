defmodule Search do

  # the format of the query will be: %{topic: "pizza", amount: 5}
  def term(%{topic: topic, amount: amount}) do
    WikipediaClient.search_for(topic, amount)
  end
end
