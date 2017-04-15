defmodule WikipediaSearchTest do
  use ExUnit.Case

  test "the correct number of result are returned from wikipedia search" do
    results = Wikipedia.Search.for_topic(%{topic: "olympics", amount: 5})
    assert length(results) == 5
  end

  test "results default to one when a non-numeric number is provided for amount" do
    results = Wikipedia.Search.for_topic(%{topic: "olympics", amount: 'ab'})
    assert length(results) == 1
  end

  test "results default to one when a negative number is provided for amount" do
    results = Wikipedia.Search.for_topic(%{topic: "olympics", amount: -23})
    assert length(results) == 1
  end

  test "the responses from wikipedia have relevant context" do
    single_result =
      %{topic: "olympics", amount: 1}
      |>  Wikipedia.Search.for_topic
      |> List.first

    assert String.contains?(single_result.description |> String.downcase, "olympics")
    assert String.contains?(single_result.link |> String.downcase, "olympic")
    assert single_result.source ==  'wikipedia'
    assert String.contains?(single_result.title |> String.downcase, "olympic")
  end
end
