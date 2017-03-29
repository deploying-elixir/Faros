defmodule MemoryDbTest do
  use ExUnit.Case, async: true

  setup do
    on_exit fn ->
      GenServer.stop(MemoryDb)
      MemoryDb.start_link
    end

    :ok
  end

  test "returns not-found when looking up an unknown term" do
    assert MemoryDb.lookup(:search, "unknown") == {"unknown", :not_found}
  end

  test "stores a list of results for a single topic" do
    results = [
      %{description: "A pizza link", link: "some-link", type: :search, source: :guardian},
      %{description: "Another pizza link", link: "link", type: :search, source: :guardian}
    ]

    MemoryDb.store("pizza", results)

    {"pizza", records} = MemoryDb.lookup(:search, "pizza")
    assert length(records)  == 2
  end

  test "stores lists of results for multiple topics" do
    pizza_results = [
      %{description: "A pizza link", link: "some-link", source: :guardian},
      %{description: "Another pizza link", link: "link", source: :guardian}
    ]
    cheese_results = [
      %{description: "A cheese link", link: "some-link", source: :guardian},
      %{description: "Another cheese link", link: "link", source: :guardian}
    ]

    MemoryDb.store("pizza", pizza_results)
    MemoryDb.store("cheese", cheese_results)

    {"pizza", p_records} = MemoryDb.lookup(:search, "pizza")
    {"cheese", c_records} = MemoryDb.lookup(:search, "cheese")
    assert length(p_records)  == 2
    assert length(c_records)  == 2
    assert %{description: "A pizza link"} = List.first(p_records)
    assert %{description: "A cheese link"} = List.first(c_records)
  end

  test "adding results for same topic will return a single list with all" do
    result_1 = [
      %{description: "A pizza link", link: "some-link", type: :search, source: :guardian}
    ]
    result_2 = [
      %{description: "Another pizza link", link: "link", type: :search, source: :guardian}
    ]
    result_3 = [
      %{description: "Another pizza link", link: "link", type: :search, source: :guardian}
    ]

    MemoryDb.store("pizza", result_1)
    MemoryDb.store("pizza", result_2)
    MemoryDb.store("pizza", result_3)

    {"pizza", records} = MemoryDb.lookup(:search, "pizza")
    assert length(records)  == 3
  end
end
