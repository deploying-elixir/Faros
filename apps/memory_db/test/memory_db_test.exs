defmodule MemoryDbTest do
  use ExUnit.Case
  doctest MemoryDb

  test "stores a search result" do
    MemoryDb.init
    search_result = %{description: "A pizza link", link: "some-link", type: :search, source: :guardian}

    MemoryDb.store(search_result)

    results = MemoryDb.lookup(%{type: :search, source: :guardian})
    assert length(results)  == 1
  end

  test "stores multiple results" do
    MemoryDb.init
    search_result = %{description: "A pizza link", link: "some-link", type: :search, source: :guardian}
    another_search_result = %{description: "Another pizza link", link: "link", type: :search, source: :guardian}

    MemoryDb.store(search_result)
    MemoryDb.store(another_search_result)

    results = MemoryDb.lookup(%{type: :search, source: :guardian})
    assert length(results)  == 2
  end

  test "stores a post" do
    MemoryDb.init
    post_result = %{url: "post-url", description: "a-description", type: :post}

    MemoryDb.store(post_result)

    results = MemoryDb.lookup(%{type: :post})
    assert length(results)  == 1
  end
end
