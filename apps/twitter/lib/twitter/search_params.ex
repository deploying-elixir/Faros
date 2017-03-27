defmodule Twitter.SearchParams do

  def build(query) when is_binary(query) do
    [{"q", query}]
  end

  def build(query) do
    approved_list = %{
      topic: "q",
      language: "lang",
      user: "from",
      amount: "count"
    }

    query
    |> find_params_from_approved_list(approved_list)
    |> package_params_with_values(approved_list)
  end

  defp find_params_from_approved_list(query, approved_list) do
    requested_query_keys = MapSet.new(Map.keys(query))
    approved_list_keys = MapSet.new(Map.keys(approved_list))

    requested_params = MapSet.intersection(requested_query_keys, approved_list_keys)

    {requested_params, query}
  end

  def package_params_with_values({requested_params, query}, approved_list) do
    for value <- requested_params, into: [] do
      param_name = Map.get(approved_list, value)
      param_value = Map.get(query, value)

      {param_name, param_value}
    end
  end
end
