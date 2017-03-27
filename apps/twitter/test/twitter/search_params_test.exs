defmodule Twitter.SearchParamsTest do
  use ExUnit.Case
  alias Twitter.SearchParams

  test "builds a list of params based on the query" do
    query = %{topic: "topic", language: "en", user: "username", amount: 10}

    result = SearchParams.build(query)

    assert list_contains?(result, {"from", "username"})
    assert list_contains?(result, {"q", "topic"})
    assert list_contains?(result, {"lang", "en"})
    assert list_contains?(result, {"count", 10})
  end

  test "some params may be omitted" do
    query = %{topic: "topic", user: "username"}

    result = SearchParams.build(query)

    assert list_contains?(result, {"from", "username"})
    assert list_contains?(result, {"q", "topic"})
    refute list_contains?(result, {"lang", "en"})
    refute list_contains?(result, {"count", 10})
  end

  test "can build the param for a topic only" do
    assert SearchParams.build("topic") == [{"q", "topic"}]
  end

  defp list_contains?(list, element) do
    Enum.member?(list, element)
  end
 end
